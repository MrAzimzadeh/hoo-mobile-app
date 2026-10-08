// HOO Studio 3D engine for the mobile app (runs inside a WebView).
// Flutter owns the DesignSpec / layers / pricing; this file only renders them and reports gestures.
// Protocol: Flutter → window.hooEngine.receive(json) ; JS → HooEngine.postMessage(json)
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';
import { DecalGeometry } from 'three/examples/jsm/geometries/DecalGeometry.js';
import { mergeGeometries } from 'three/examples/jsm/utils/BufferGeometryUtils.js';
import {
  garmentSpec, torsoPoint, torsoNormal, sleevePoint, hoodPoint, surfaceAt, placementFacing, cameraForPlacement,
  zoneFrame, zoneDepth, cameraForZone, zoneFacing,
} from './garment.js';

// ---------------------------------------------------------------- bridge
function post(msg) {
  const s = JSON.stringify(msg);
  if (window.HooEngine && window.HooEngine.postMessage) window.HooEngine.postMessage(s);
  else console.log('[engine→]', s);
}
window.onerror = (m) => post({ type: 'error', message: String(m) });

// ---------------------------------------------------------------- constants (mirror studio-engine domain)
const PT_TO_CM = 2.54 / 72;
const MIN_LAYER_CM = 0.5;
const MAX_LAYER_CM = 60;
const r2 = (n) => Math.round(n * 100) / 100;
const r3 = (n) => Math.round(n * 1000) / 1000;
const clamp = (v, min, max) => Math.min(Math.max(v, min), Math.max(min, max));
const FONT_STACKS = {
  Archivo: 'Archivo, Arial, sans-serif',
  Bebas: "'Bebas Neue', Impact, sans-serif",
  Space: "'Space Grotesk', system-ui, sans-serif",
  Montserrat: 'Montserrat, Arial, sans-serif',
  Inter: 'Inter, system-ui, sans-serif',
};
const fontStack = (f) => (f && FONT_STACKS[f]) || (f ? `'${f}', Inter, system-ui, sans-serif` : 'Inter, system-ui, sans-serif');
const FREE_PREFIX = 'free-';
const isFreeLayer = (l) => !!l.anchor && typeof l.placement === 'string' && l.placement.startsWith(FREE_PREFIX);

function clampLayer(layer, area) {
  const width = clamp(layer.widthCm, MIN_LAYER_CM, Math.min(area.widthCm, MAX_LAYER_CM));
  const height = clamp(layer.heightCm, MIN_LAYER_CM, Math.min(area.heightCm, MAX_LAYER_CM));
  return { ...layer, widthCm: r2(width), heightCm: r2(height), xCm: r2(clamp(layer.xCm, 0, area.widthCm - width)), yCm: r2(clamp(layer.yCm, 0, area.heightCm - height)) };
}
const rotateVec = (x, y, deg) => {
  const a = (deg * Math.PI) / 180, c = Math.cos(a), s = Math.sin(a);
  return [x * c - y * s, x * s + y * c];
};
const layerCenter = (l) => [l.xCm + l.widthCm / 2, l.yCm + l.heightCm / 2];
function hitTestLayer(layers, x, y) {
  const sorted = [...layers].sort((a, b) => b.zIndex - a.zIndex);
  for (const l of sorted) {
    if (l.hidden) continue;
    const [cx, cy] = layerCenter(l);
    const [lx, ly] = rotateVec(x - cx, y - cy, -l.rotation);
    // generous touch slop (≈ 1cm) so small layers stay grabbable with a finger
    if (Math.abs(lx) <= l.widthCm / 2 + 1 && Math.abs(ly) <= l.heightCm / 2 + 1) return l;
  }
  return null;
}
function snapToCenter(l, area, threshold = 0.6) {
  const [cx, cy] = layerCenter(l);
  const gx = Math.abs(cx - area.widthCm / 2) <= threshold, gy = Math.abs(cy - area.heightCm / 2) <= threshold;
  return { xCm: gx ? area.widthCm / 2 - l.widthCm / 2 : l.xCm, yCm: gy ? area.heightCm / 2 - l.heightCm / 2 : l.yCm, guideX: gx, guideY: gy };
}
const freePad = (l) => Math.min(4, 0.4 + Math.max(l.widthCm, l.heightCm) * 0.12);
const freeRenderArea = (l) => { const p = freePad(l); return { placement: l.placement, widthCm: l.widthCm + 2 * p, heightCm: l.heightCm + 2 * p }; };
const freeZone = (l) => { const a = freeRenderArea(l); return { code: l.placement, position: l.anchor.position, normal: l.anchor.normal, rotation: -(l.rotation || 0), widthCm: a.widthCm, heightCm: a.heightCm }; };
const freeTextureLayer = (l) => { const p = freePad(l); return { ...l, xCm: p, yCm: p, rotation: 0 }; };

// ---------------------------------------------------------------- state
const state = {
  areas: [],            // PrintArea[] { placement, widthCm, heightCm }
  layers: [],           // DesignLayer[] (+ hidden flag from Flutter)
  images: {},           // uploadId → url (data: or http)
  colorHex: '#121212',
  active: 'Front',
  selectedId: null,
  editable: true,
  showGuides: true,
  spec: null,           // procedural garment spec
  template: null,       // { heightCm, tintable, zones[] }
  model: null,          // loaded template model { root, meshes, size }
  background: '#F7F7F5',
  reducedMotion: false,
};

// ---------------------------------------------------------------- three setup
const canvas = document.getElementById('stage');
const renderer = new THREE.WebGLRenderer({ canvas, antialias: true, alpha: true, preserveDrawingBuffer: true });
renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, 2.5));
renderer.outputColorSpace = THREE.SRGBColorSpace;
renderer.toneMapping = THREE.ACESFilmicToneMapping;
renderer.toneMappingExposure = 1.05;
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(30, 1, 1, 2000);
const controls = new OrbitControls(camera, canvas);
controls.enableDamping = true;
controls.dampingFactor = 0.08;
controls.enablePan = false;
controls.minDistance = 70;
controls.maxDistance = 320;
controls.rotateSpeed = 0.7;

scene.add(new THREE.HemisphereLight('#ffffff', '#8fa597', 1.15));
for (const [p, i, c] of [
  [[80, 140, 160], 1.7, '#ffffff'], [[-140, 60, -120], 0.8, '#ffffff'],
  [[-160, 90, -90], 1.6, '#cfe6d8'], [[160, 90, -90], 1.6, '#cfe6d8'], [[0, -60, 120], 0.5, '#ffffff'],
]) {
  const l = new THREE.DirectionalLight(c, i);
  l.position.set(...p);
  scene.add(l);
}

const garment = new THREE.Group();
scene.add(garment);
let fabricMaterials = [];
let surfaces = new Map(); // placement → { mesh, overlay, canvas, texture, overlayCanvas, overlayTexture, area }

function resize() {
  const w = window.innerWidth, h = window.innerHeight;
  renderer.setSize(w, h, false);
  camera.aspect = w / Math.max(1, h);
  camera.updateProjectionMatrix();
  dirty = true;
}
window.addEventListener('resize', resize);

// ---------------------------------------------------------------- helpers
function gridGeometry(nu, nv, fn, offset = 0, computeNormals = false) {
  const pos = [], nor = [], uv = [], idx = [];
  let last = null;
  for (let j = 0; j <= nv; j++) {
    for (let i = 0; i <= nu; i++) {
      const u = i / nu, v = j / nv;
      const s = fn(u, v) || last || { position: [0, 0, 0], normal: [0, 0, 1] };
      last = s;
      pos.push(s.position[0] + s.normal[0] * offset, s.position[1] + s.normal[1] * offset, s.position[2] + s.normal[2] * offset);
      nor.push(...s.normal);
      uv.push(u, 1 - v);
    }
  }
  for (let j = 0; j < nv; j++)
    for (let i = 0; i < nu; i++) {
      const a = j * (nu + 1) + i, b = a + 1, c = a + nu + 1, d = c + 1;
      idx.push(a, c, b, b, c, d);
    }
  const g = new THREE.BufferGeometry();
  g.setAttribute('position', new THREE.Float32BufferAttribute(pos, 3));
  g.setAttribute('normal', new THREE.Float32BufferAttribute(nor, 3));
  g.setAttribute('uv', new THREE.Float32BufferAttribute(uv, 2));
  g.setIndex(idx);
  if (computeNormals) g.computeVertexNormals();
  return g;
}
const ring = (points, radius) => new THREE.TubeGeometry(new THREE.CatmullRomCurve3(points, true), 96, radius, 8, true);

function fabric() {
  const m = new THREE.MeshStandardMaterial({ color: state.colorHex, roughness: 0.92, metalness: 0, side: THREE.DoubleSide });
  fabricMaterials.push(m);
  return m;
}

function clearGarment() {
  for (const s of surfaces.values()) disposeSurface(s);
  surfaces = new Map();
  garment.traverse((o) => { if (o.geometry) o.geometry.dispose(); });
  garment.clear();
  fabricMaterials = [];
  state.model = null;
}

function buildProcedural(productType, model) {
  const spec = garmentSpec(productType, model);
  state.spec = spec;
  state.template = null;
  const torso = gridGeometry(72, 44, (u, v) => {
    const y = spec.height * (1 - v);
    const theta = u * Math.PI * 2 - Math.PI;
    return { position: torsoPoint(spec, theta, y), normal: torsoNormal(spec, theta, y) };
  });
  garment.add(new THREE.Mesh(torso, fabric()));
  for (const side of [1, -1]) {
    const L = spec.sleeve.length;
    garment.add(new THREE.Mesh(gridGeometry(40, 20, (u, v) => sleevePoint(spec, side, -5 + (L + 5) * v, u * Math.PI * 2), 0, true), fabric()));
    const cuff = Array.from({ length: 40 }, (_, i) => new THREE.Vector3(...sleevePoint(spec, side, L, (i / 40) * Math.PI * 2).position));
    garment.add(new THREE.Mesh(ring(cuff, 1.6), fabric()));
  }
  if (spec.hood) garment.add(new THREE.Mesh(gridGeometry(40, 24, (u, v) => hoodPoint(spec, (u - 0.5) * Math.PI * 1.7, -0.22 * Math.PI + v * 0.72 * Math.PI), 0, true), fabric()));
  const torsoRing = (y, r, inset = 0) => ring(Array.from({ length: 48 }, (_, i) => {
    const p = torsoPoint(spec, (i / 48) * Math.PI * 2, y);
    return new THREE.Vector3(p[0] * (1 - inset), p[1], p[2] * (1 - inset));
  }), r);
  garment.add(new THREE.Mesh(torsoRing(1.2, 1.8), fabric()));
  garment.add(new THREE.Mesh(torsoRing(spec.height - 0.6, 1.4, 0.02), fabric()));
  frame(spec.height);
}

function frame(height) {
  const target = new THREE.Vector3(0, height * 0.52, 0);
  controls.target.copy(target);
  const dist = height * 2.55;
  controls.minDistance = height * 1.1;
  controls.maxDistance = height * 4.2;
  setCameraAngles(0, Math.PI / 2.15, dist, false);
}

function setCameraAngles(azimuth, polar, dist, animate) {
  const t = controls.target;
  const d = dist || camera.position.distanceTo(t);
  const to = new THREE.Vector3(
    t.x + d * Math.sin(polar) * Math.sin(azimuth),
    t.y + d * Math.cos(polar),
    t.z + d * Math.sin(polar) * Math.cos(azimuth),
  );
  if (!animate || state.reducedMotion) {
    camera.position.copy(to);
    camera.lookAt(t);
    dirty = true;
    return;
  }
  // spherical tween (easeOutCubic, 700ms) so the camera orbits instead of cutting through the garment
  const from = new THREE.Spherical().setFromVector3(camera.position.clone().sub(t));
  const goal = new THREE.Spherical().setFromVector3(to.clone().sub(t));
  let dTheta = goal.theta - from.theta;
  if (dTheta > Math.PI) dTheta -= Math.PI * 2;
  if (dTheta < -Math.PI) dTheta += Math.PI * 2;
  const start = performance.now(), dur = 700;
  tween = (now) => {
    const k = Math.min(1, (now - start) / dur), e = 1 - Math.pow(1 - k, 3);
    const s = new THREE.Spherical(from.radius + (goal.radius - from.radius) * e, from.phi + (goal.phi - from.phi) * e, from.theta + dTheta * e);
    camera.position.copy(t).add(new THREE.Vector3().setFromSpherical(s));
    camera.lookAt(t);
    if (k >= 1) tween = null;
    dirty = true;
  };
}

// ---------------------------------------------------------------- template (uploaded GLB)
function base64ToBuffer(b64) {
  const bin = atob(b64);
  const out = new Uint8Array(bin.length);
  for (let i = 0; i < bin.length; i++) out[i] = bin.charCodeAt(i);
  return out.buffer;
}

async function buildTemplate(tpl) {
  const gltf = await new GLTFLoader().parseAsync(base64ToBuffer(tpl.glbBase64), '');
  const sceneRoot = gltf.scene;
  const root = new THREE.Group();
  root.add(sceneRoot);
  sceneRoot.updateMatrixWorld(true);
  const box = new THREE.Box3().setFromObject(sceneRoot);
  const k = tpl.heightCm / Math.max(1e-6, box.max.y - box.min.y);
  sceneRoot.scale.multiplyScalar(k);
  sceneRoot.position.set(-((box.min.x + box.max.x) / 2) * k, -box.min.y * k, -((box.min.z + box.max.z) / 2) * k);
  root.updateMatrixWorld(true);
  const meshes = [];
  root.traverse((o) => {
    if (!o.isMesh || !o.geometry?.attributes.position) return;
    o.material = Array.isArray(o.material) ? o.material.map((x) => x.clone()) : o.material.clone();
    for (const mat of Array.isArray(o.material) ? o.material : [o.material]) {
      if (mat.color) mat.userData.baseColor = mat.color.clone();
      mat.side = THREE.DoubleSide;
      if (mat.color) fabricMaterials.push(mat);
    }
    o.geometry.computeBoundingBox();
    meshes.push(o);
  });
  const size = new THREE.Box3().setFromObject(root).getSize(new THREE.Vector3());
  state.model = { root, meshes, size };
  state.template = { heightCm: tpl.heightCm, tintable: tpl.tintable, zones: tpl.zones || [] };
  state.spec = null;
  garment.add(root);
  frame(size.y);
}

const _box = new THREE.Box3();
const _sphere = new THREE.Sphere();
function buildZoneDecal(zone) {
  const model = state.model;
  const f = zoneFrame([zone.normal.x, zone.normal.y, zone.normal.z], zone.rotation || 0);
  const basis = new THREE.Matrix4().makeBasis(new THREE.Vector3(...f.x), new THREE.Vector3(...f.y), new THREE.Vector3(...f.z));
  const orientation = new THREE.Euler().setFromRotationMatrix(basis);
  const position = new THREE.Vector3(zone.position.x, zone.position.y, zone.position.z);
  const size = new THREE.Vector3(Math.max(0.1, zone.widthCm), Math.max(0.1, zone.heightCm), zoneDepth(zone));
  _sphere.set(position, size.length() / 2);
  const parts = [];
  for (const mesh of model.meshes) {
    _box.copy(mesh.geometry.boundingBox).applyMatrix4(mesh.matrixWorld);
    if (!_box.intersectsSphere(_sphere)) continue;
    const g = new DecalGeometry(mesh, position, orientation, size);
    if (g.attributes.position.count === 0) { g.dispose(); continue; }
    if (!g.attributes.normal) g.computeVertexNormals();
    parts.push(dropBackFaces(g, f.z));
  }
  if (!parts.length) return new THREE.BufferGeometry();
  const merged = parts.length === 1 ? parts[0] : mergeGeometries(parts, false) || new THREE.BufferGeometry();
  const pos = merged.attributes.position, nor = merged.attributes.normal;
  if (pos && nor) for (let i = 0; i < pos.count; i++) pos.setXYZ(i, pos.getX(i) + nor.getX(i) * 0.15, pos.getY(i) + nor.getY(i) * 0.15, pos.getZ(i) + nor.getZ(i) * 0.15);
  merged.computeBoundingSphere();
  return merged;
}
function dropBackFaces(g, dir) {
  const pos = g.attributes.position, nor = g.attributes.normal, uv = g.attributes.uv;
  const keep = [];
  for (let i = 0; i < pos.count; i += 3) {
    let d = 0;
    for (let k = 0; k < 3; k++) d += nor.getX(i + k) * dir[0] + nor.getY(i + k) * dir[1] + nor.getZ(i + k) * dir[2];
    if (d / 3 > 0.05) keep.push(i);
  }
  if (keep.length * 3 === pos.count) return g;
  const out = new THREE.BufferGeometry();
  const copy = (attr, n) => {
    const a = new Float32Array(keep.length * 3 * n);
    keep.forEach((i, t) => { for (let k = 0; k < 3; k++) for (let c = 0; c < n; c++) a[(t * 3 + k) * n + c] = attr.getComponent(i + k, c); });
    return new THREE.Float32BufferAttribute(a, n);
  };
  out.setAttribute('position', copy(pos, 3));
  out.setAttribute('normal', copy(nor, 3));
  out.setAttribute('uv', copy(uv, 2));
  g.dispose();
  return out;
}

// ---------------------------------------------------------------- print surfaces
function makeSurface(key, geometry, area, placement) {
  const c = document.createElement('canvas');
  const texture = new THREE.CanvasTexture(c);
  texture.colorSpace = THREE.SRGBColorSpace;
  texture.anisotropy = Math.min(8, renderer.capabilities.getMaxAnisotropy());
  const mesh = new THREE.Mesh(geometry, new THREE.MeshStandardMaterial({
    map: texture, transparent: true, roughness: 0.9, metalness: 0, depthWrite: false,
    polygonOffset: true, polygonOffsetFactor: -2, polygonOffsetUnits: -2, side: THREE.DoubleSide,
  }));
  mesh.renderOrder = 2;
  mesh.userData.placement = placement;
  const oc = document.createElement('canvas');
  const overlayTexture = new THREE.CanvasTexture(oc);
  overlayTexture.colorSpace = THREE.SRGBColorSpace;
  const overlay = new THREE.Mesh(geometry, new THREE.MeshBasicMaterial({
    map: overlayTexture, transparent: true, depthWrite: false, polygonOffset: true, polygonOffsetFactor: -3, polygonOffsetUnits: -3,
    side: THREE.DoubleSide, toneMapped: false, opacity: 0,
  }));
  overlay.renderOrder = 3;
  overlay.raycast = () => {};
  garment.add(mesh);
  garment.add(overlay);
  const s = { key, mesh, overlay, canvas: c, texture, overlayCanvas: oc, overlayTexture, area, placement, guide: 0, guideTarget: 0 };
  surfaces.set(key, s);
  return s;
}
function disposeSurface(s) {
  garment.remove(s.mesh);
  garment.remove(s.overlay);
  s.mesh.geometry.dispose();
  s.mesh.material.dispose();
  s.overlay.material.dispose();
  s.texture.dispose();
  s.overlayTexture.dispose();
}

function rebuildSurfaces() {
  for (const s of surfaces.values()) disposeSurface(s);
  surfaces = new Map();
  if (state.spec) {
    const spec = state.spec;
    for (const area of state.areas) {
      if (!surfaceAt(spec, area.placement, area, area.widthCm / 2, area.heightCm / 2)) continue;
      const nu = Math.min(60, Math.max(12, Math.round(area.widthCm * 1.5))), nv = Math.min(60, Math.max(12, Math.round(area.heightCm * 1.5)));
      const g = gridGeometry(nu, nv, (u, v) => surfaceAt(spec, area.placement, area, u * area.widthCm, v * area.heightCm), 0.32);
      makeSurface(area.placement, g, area, area.placement);
    }
  } else if (state.model && state.template) {
    for (const zone of state.template.zones) {
      const area = state.areas.find((a) => a.placement === zone.code) || { placement: zone.code, widthCm: zone.widthCm, heightCm: zone.heightCm };
      makeSurface(zone.code, buildZoneDecal(zone), area, zone.code);
    }
  }
  syncFreeSurfaces(true);
  repaintAll();
}

/** Free layers (anchored anywhere on an uploaded model) each get their own projected surface. */
function syncFreeSurfaces(force) {
  if (!state.model) return;
  const free = state.layers.filter(isFreeLayer);
  const wanted = new Set(free.map((l) => 'free:' + l.id));
  for (const [k, s] of [...surfaces.entries()]) if (k.startsWith('free:') && (force || !wanted.has(k))) { disposeSurface(s); surfaces.delete(k); }
  for (const l of free) {
    const key = 'free:' + l.id;
    const sig = JSON.stringify([l.anchor, l.widthCm, l.heightCm, l.rotation]);
    const cur = surfaces.get(key);
    if (cur && cur.sig === sig) continue;
    if (cur) { disposeSurface(cur); surfaces.delete(key); }
    const s = makeSurface(key, buildZoneDecal(freeZone(l)), freeRenderArea(l), l.placement);
    s.sig = sig;
    s.freeLayerId = l.id;
  }
}

const imageCache = new Map();
function loadImage(url) {
  let p = imageCache.get(url);
  if (!p) {
    p = new Promise((resolve) => {
      const img = new Image();
      if (!url.startsWith('data:') && !url.startsWith('blob:')) img.crossOrigin = 'anonymous';
      img.onload = () => resolve(img);
      img.onerror = () => resolve(null);
      img.src = url;
    });
    imageCache.set(url, p);
  }
  return p;
}
const readyImages = new Map();

function layersFor(s) {
  if (s.freeLayerId) {
    const l = state.layers.find((x) => x.id === s.freeLayerId);
    return l ? [freeTextureLayer(l)] : [];
  }
  return state.layers.filter((l) => l.placement === s.placement && !isFreeLayer(l));
}

function paint(s) {
  const area = s.area;
  const ppcm = Math.min(40, 1600 / Math.max(area.widthCm, area.heightCm));
  const w = Math.max(1, Math.round(area.widthCm * ppcm)), h = Math.max(1, Math.round(area.heightCm * ppcm));
  if (s.canvas.width !== w) s.canvas.width = w;
  if (s.canvas.height !== h) s.canvas.height = h;
  const ctx = s.canvas.getContext('2d');
  ctx.clearRect(0, 0, w, h);
  const pending = [];
  for (const layer of [...layersFor(s)].sort((a, b) => a.zIndex - b.zIndex)) {
    if (layer.hidden) continue;
    const lw = layer.widthCm * ppcm, lh = layer.heightCm * ppcm;
    ctx.save();
    ctx.translate(layer.xCm * ppcm + lw / 2, layer.yCm * ppcm + lh / 2);
    ctx.rotate((layer.rotation * Math.PI) / 180);
    if (layer.kind === 'Text' && layer.text) {
      const em = (layer.fontSizePt || 24) * PT_TO_CM * ppcm;
      ctx.fillStyle = layer.colorHex || '#121212';
      ctx.font = `600 ${em}px ${fontStack(layer.font)}`;
      ctx.textBaseline = 'middle';
      const align = layer.align || 'center';
      ctx.textAlign = align;
      const ax = align === 'left' ? -lw / 2 : align === 'right' ? lw / 2 : 0;
      const lines = layer.text.split('\n');
      lines.forEach((line, i) => ctx.fillText(line, ax, (i - (lines.length - 1) / 2) * em * 1.2));
    } else if (layer.kind === 'Image' && layer.uploadId) {
      const url = state.images[layer.uploadId];
      if (url) {
        const img = readyImages.get(url);
        if (img) ctx.drawImage(img, -lw / 2, -lh / 2, lw, lh);
        else pending.push(url);
      }
    }
    ctx.restore();
  }
  s.texture.needsUpdate = true;
  paintOverlay(s);
  dirty = true;
  if (pending.length) Promise.all(pending.map((u) => loadImage(u).then((img) => img && readyImages.set(u, img)))).then(() => paint(s));
}

function paintOverlay(s) {
  const area = s.area;
  const ppcm = Math.min(24, 1024 / Math.max(area.widthCm, area.heightCm));
  const c = s.overlayCanvas;
  c.width = Math.max(2, Math.round(area.widthCm * ppcm));
  c.height = Math.max(2, Math.round(area.heightCm * ppcm));
  const ctx = c.getContext('2d');
  ctx.clearRect(0, 0, c.width, c.height);
  const stroke = (draw, dash = []) => {
    ctx.setLineDash(dash);
    ctx.lineWidth = 4; ctx.strokeStyle = 'rgba(0,0,0,0.45)'; draw();
    ctx.lineWidth = 2; ctx.strokeStyle = '#ffffff'; draw();
  };
  const isZone = !s.freeLayerId;
  if (isZone) stroke(() => ctx.strokeRect(3, 3, c.width - 6, c.height - 6), [12, 9]);
  const sel = layersFor(s).find((l) => l.id === state.selectedId);
  if (sel) {
    const [cx, cy] = layerCenter(sel);
    stroke(() => {
      ctx.beginPath();
      [[-1, -1], [1, -1], [1, 1], [-1, 1]].forEach(([sx, sy], i) => {
        const [x, y] = rotateVec((sx * sel.widthCm) / 2, (sy * sel.heightCm) / 2, sel.rotation);
        const px = (cx + x) * ppcm, py = (cy + y) * ppcm;
        i ? ctx.lineTo(px, py) : ctx.moveTo(px, py);
      });
      ctx.closePath();
      ctx.stroke();
    });
  }
  if (snapGuide && snapGuide.key === s.key) {
    ctx.setLineDash([]);
    ctx.lineWidth = 2;
    ctx.strokeStyle = '#4f7a62';
    if (snapGuide.x) { ctx.beginPath(); ctx.moveTo(c.width / 2, 0); ctx.lineTo(c.width / 2, c.height); ctx.stroke(); }
    if (snapGuide.y) { ctx.beginPath(); ctx.moveTo(0, c.height / 2); ctx.lineTo(c.width, c.height / 2); ctx.stroke(); }
  }
  s.overlayTexture.needsUpdate = true;
  s.guideTarget = !state.editable || !state.showGuides ? (sel ? 1 : 0) : s.placement === state.active || sel ? 1 : 0;
  dirty = true;
}

function repaintAll() { for (const s of surfaces.values()) paint(s); }

// ---------------------------------------------------------------- gestures (direct manipulation)
const raycaster = new THREE.Raycaster();
const ndc = new THREE.Vector2();
let drag = null;   // { id, key, start, x, y, began, free }
let press = null;  // { hit, sx, sy }
let snapGuide = null;

function pointerRay(ev) {
  const r = canvas.getBoundingClientRect();
  ndc.set(((ev.clientX - r.left) / r.width) * 2 - 1, -((ev.clientY - r.top) / r.height) * 2 + 1);
  raycaster.setFromCamera(ndc, camera);
}
function surfaceHit(ev) {
  pointerRay(ev);
  // nearest hit on the whole garment: a print surface in front of the fabric wins, fabric in front of it blocks it
  const first = raycaster.intersectObject(garment, true)[0];
  if (!first || !first.object.userData.placement || !first.uv) return null;
  const s = [...surfaces.values()].find((x) => x.mesh === first.object);
  if (!s) return null;
  return { s, x: first.uv.x * s.area.widthCm, y: (1 - first.uv.y) * s.area.heightCm };
}
function modelSurfaceAt(ev) {
  if (!state.model) return null;
  pointerRay(ev);
  const hit = raycaster.intersectObjects(state.model.meshes, false)[0];
  if (!hit) return null;
  const n = (hit.face?.normal || new THREE.Vector3(0, 0, 1)).clone().transformDirection(hit.object.matrixWorld);
  if (n.dot(raycaster.ray.direction) > 0) n.negate();
  n.normalize();
  return { position: { x: r2(hit.point.x), y: r2(hit.point.y), z: r2(hit.point.z) }, normal: { x: r3(n.x), y: r3(n.y), z: r3(n.z) } };
}

canvas.addEventListener('pointerdown', (ev) => {
  if (!state.editable || (ev.pointerType === 'touch' && ev.isPrimary === false)) { cancelDrag(); return; }
  const h = surfaceHit(ev);
  if (!h) { press = { surface: true, sx: ev.clientX, sy: ev.clientY, ev }; return; }
  const candidates = layersFor(h.s);
  const hit = hitTestLayer(candidates, h.x, h.y);
  if (!hit) { press = { hit: h, sx: ev.clientX, sy: ev.clientY }; return; }
  const real = state.layers.find((l) => l.id === hit.id);
  state.selectedId = hit.id;
  post({ type: 'selectLayer', id: hit.id });
  repaintAll();
  if (real.locked) return;
  drag = { id: hit.id, key: h.s.key, start: real, x: h.x, y: h.y, began: false, free: !!h.s.freeLayerId };
  controls.enabled = false;
}, { capture: true });

canvas.addEventListener('pointermove', (ev) => {
  if (!drag) return;
  if (drag.free) {
    const sp = modelSurfaceAt(ev);
    if (!sp) return;
    if (!drag.began) { drag.began = true; post({ type: 'gestureStart', id: drag.id }); }
    const l = state.layers.find((x) => x.id === drag.id);
    if (!l) return;
    l.anchor = sp;
    syncFreeSurfaces(false);
    repaintAll();
    post({ type: 'moveSurface', id: drag.id, anchor: sp });
    return;
  }
  const h = surfaceHit(ev);
  if (!h || h.s.key !== drag.key) return; // stays at its last spot when the finger leaves the zone
  if (!drag.began) { drag.began = true; post({ type: 'gestureStart', id: drag.id }); }
  const moved = clampLayer({ ...drag.start, xCm: drag.start.xCm + (h.x - drag.x), yCm: drag.start.yCm + (h.y - drag.y) }, h.s.area);
  const snap = snapToCenter(moved, h.s.area);
  const l = state.layers.find((x) => x.id === drag.id);
  if (!l) return;
  l.xCm = r2(snap.xCm);
  l.yCm = r2(snap.yCm);
  snapGuide = snap.guideX || snap.guideY ? { key: h.s.key, x: snap.guideX, y: snap.guideY } : null;
  paint(h.s);
  post({ type: 'moveLayer', id: drag.id, xCm: l.xCm, yCm: l.yCm });
});

function endPointer(ev) {
  const pr = press;
  press = null;
  if (pr && Math.hypot(ev.clientX - pr.sx, ev.clientY - pr.sy) < 8) {
    if (pr.hit) post({ type: 'placeAt', placement: pr.hit.s.placement, xCm: r2(pr.hit.x), yCm: r2(pr.hit.y) });
    else if (pr.surface) {
      const sp = modelSurfaceAt(ev);
      state.selectedId = null;
      repaintAll();
      post({ type: 'selectLayer', id: null });
      if (sp) post({ type: 'placeSurface', at: sp });
    }
  }
  cancelDrag();
}
function cancelDrag() {
  if (!drag) return;
  const d = drag;
  drag = null;
  snapGuide = null;
  controls.enabled = true;
  repaintAll();
  if (d.began) post({ type: 'gestureEnd', id: d.id });
}
window.addEventListener('pointerup', endPointer);
window.addEventListener('pointercancel', () => { press = null; cancelDrag(); });

// report which print area faces the camera so Flutter can follow it ("working area")
let lastFacing = null;
controls.addEventListener('change', () => {
  dirty = true;
  const eye = [camera.position.x, camera.position.y, camera.position.z];
  let facing = null;
  if (state.spec) facing = placementFacing(state.spec, state.areas, state.active, eye);
  else if (state.template) facing = zoneFacing(state.template.zones, state.active, eye);
  if (facing && facing !== lastFacing) {
    lastFacing = facing;
    post({ type: 'facing', placement: facing });
  }
});

// ---------------------------------------------------------------- colour transition
let colorTween = null;
function setColor(hex, animate) {
  state.colorHex = hex;
  const to = new THREE.Color(hex);
  const tintable = state.template ? state.template.tintable : true;
  if (!animate || state.reducedMotion) {
    for (const m of fabricMaterials) m.color.copy(tintable ? to : (m.userData.baseColor || m.color));
    dirty = true;
    return;
  }
  if (!tintable) return;
  const from = fabricMaterials.map((m) => m.color.clone());
  const start = performance.now();
  colorTween = (now) => {
    const k = Math.min(1, (now - start) / 450), e = 1 - Math.pow(1 - k, 3);
    fabricMaterials.forEach((m, i) => m.color.copy(from[i]).lerp(to, e));
    if (k >= 1) colorTween = null;
    dirty = true;
  };
}

// ---------------------------------------------------------------- render loop
let dirty = true;
let tween = null;
function loop(now) {
  requestAnimationFrame(loop);
  if (tween) tween(now);
  if (colorTween) colorTween(now);
  const changed = controls.update();
  let overlayAnim = false;
  for (const s of surfaces.values()) {
    const target = s.guideTarget;
    if (Math.abs(s.guide - target) > 0.01) {
      s.guide += (target - s.guide) * (state.reducedMotion ? 1 : 0.18);
      s.overlay.material.opacity = s.guide;
      overlayAnim = true;
    } else if (s.overlay.material.opacity !== target) {
      s.guide = target;
      s.overlay.material.opacity = target;
      overlayAnim = true;
    }
  }
  if (dirty || changed || overlayAnim) {
    renderer.render(scene, camera);
    dirty = false;
  }
}

// ---------------------------------------------------------------- snapshots (mockups for the bag / review)
function snapshot(views, size, mime) {
  const prev = { pos: camera.position.clone(), aspect: camera.aspect, w: renderer.domElement.width, h: renderer.domElement.height };
  const prevSel = state.selectedId;
  const prevGuides = state.showGuides;
  state.selectedId = null;
  state.showGuides = false;
  for (const s of surfaces.values()) { paintOverlay(s); s.overlay.material.opacity = 0; }
  renderer.setPixelRatio(1);
  renderer.setSize(size, Math.round(size * 1.25), false);
  camera.aspect = 1 / 1.25;
  camera.updateProjectionMatrix();
  const out = {};
  const dist = (state.model ? state.model.size.y : state.spec ? state.spec.height : 70) * 2.45;
  for (const v of views) {
    const ang = v === 'back' ? { azimuth: Math.PI, polar: Math.PI / 2.15 } : { azimuth: 0, polar: Math.PI / 2.15 };
    setCameraAngles(ang.azimuth, ang.polar, dist, false);
    renderer.render(scene, camera);
    out[v] = renderer.domElement.toDataURL(mime || 'image/png');
  }
  renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, 2.5));
  camera.position.copy(prev.pos);
  camera.lookAt(controls.target);
  state.selectedId = prevSel;
  state.showGuides = prevGuides;
  resize();
  repaintAll();
  return out;
}

// ---------------------------------------------------------------- inbound messages
async function receive(raw) {
  const msg = typeof raw === 'string' ? JSON.parse(raw) : raw;
  try {
    switch (msg.type) {
      case 'init':
        state.reducedMotion = !!msg.reducedMotion;
        if (msg.background) document.body.style.background = msg.background;
        break;
      case 'loadModel': {
        clearGarment();
        state.areas = msg.printAreas || [];
        state.colorHex = msg.colorHex || state.colorHex;
        if (msg.template && msg.template.glbBase64) {
          try { await buildTemplate(msg.template); } catch (e) { post({ type: 'modelFailed', message: String(e) }); clearGarment(); buildProcedural(msg.productType, msg.model); }
        } else buildProcedural(msg.productType, msg.model);
        setColor(state.colorHex, false);
        rebuildSurfaces();
        post({ type: 'modelLoaded', zones: state.template ? state.template.zones.map((z) => z.code) : state.areas.map((a) => a.placement) });
        break;
      }
      case 'setAreas':
        state.areas = msg.printAreas || [];
        rebuildSurfaces();
        break;
      case 'setColor':
        setColor(msg.hex, msg.animate !== false);
        break;
      case 'setImages':
        Object.assign(state.images, msg.images || {});
        repaintAll();
        break;
      case 'setLayers':
        state.layers = (msg.layers || []).map((l) => ({ ...l }));
        if (msg.images) Object.assign(state.images, msg.images);
        if (msg.selectedId !== undefined) state.selectedId = msg.selectedId;
        if (!drag) { syncFreeSurfaces(false); repaintAll(); }
        break;
      case 'select':
        state.selectedId = msg.id || null;
        repaintAll();
        break;
      case 'setActive':
        state.active = msg.placement;
        state.showGuides = msg.showGuides !== false;
        lastFacing = msg.placement;
        repaintAll();
        if (msg.focus) focusPlacement(msg.placement);
        break;
      case 'focus':
        focusPlacement(msg.placement);
        break;
      case 'setEditable':
        state.editable = !!msg.editable;
        repaintAll();
        break;
      case 'resetView':
        setCameraAngles(0, Math.PI / 2.15, null, true);
        break;
      case 'snapshot':
        post({ type: 'snapshot', requestId: msg.requestId, images: snapshot(msg.views || ['front', 'back'], msg.size || 1024, msg.mime) });
        break;
      default:
        break;
    }
  } catch (e) {
    post({ type: 'error', message: String(e && e.stack || e) });
  }
}

function focusPlacement(placement) {
  if (state.template) {
    const z = state.template.zones.find((x) => x.code === placement);
    if (z) { const c = cameraForZone(z.normal); setCameraAngles(c.azimuth, c.polar, null, true); }
    return;
  }
  const c = cameraForPlacement(placement);
  setCameraAngles(c.azimuth, c.polar, null, true);
}

window.hooEngine = { receive };
resize();
requestAnimationFrame(loop);
post({ type: 'ready' });
