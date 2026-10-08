// Port of @hoo/studio-engine domain/garment.ts — procedural garment + 2D print-area → 3D surface mapping.
// Scene units are centimetres, +y up, front faces +z, wearer's LEFT is +x.

export function garmentKindFor(productType, model) {
  const t = (model || productType || '').toLowerCase();
  if (t.includes('hood')) return 'hoodie';
  if (t.includes('sweat')) return 'sweatshirt';
  if (t.includes('long')) return 'longsleeve';
  return 'tee';
}

export function garmentSpec(productType, model) {
  const kind = garmentKindFor(productType, model);
  const big = kind === 'hoodie' || kind === 'sweatshirt';
  const H = kind === 'tee' ? 70 : 72;
  const k = big ? 1.04 : 1;
  const profile = [
    { y: 0, a: 30 * k, b: 14.5 * k },
    { y: 14, a: 31 * k, b: 15.2 * k },
    { y: 40, a: 30.5 * k, b: 15 * k },
    { y: 52, a: 29 * k, b: 14.3 * k },
    { y: H - 10, a: 25 * k, b: 12.8 },
    { y: H - 4, a: 17, b: 10.5 },
    { y: H - 1.2, a: 9.5, b: 8 },
    { y: H, a: 8.8, b: 7.4 },
  ];
  const long = kind !== 'tee';
  return {
    kind,
    height: H,
    profile,
    sleeve: {
      length: long ? 58 : 23,
      rJoint: 11.5 * k,
      rCuff: long ? 6.8 : 10 * k,
      droopDeg: long ? 52 : 32,
      joint: [24 * k, H - 11, 0],
      printStart: long ? 9 : 4,
    },
    hood: kind === 'hoodie' ? { center: [0, H + 1, -8.5], rx: 17.5, ry: 23, rz: 16.5 } : null,
    printTopY: H - 10,
  };
}

const smooth = (t) => t * t * (3 - 2 * t);
export function torsoAB(spec, y) {
  const p = spec.profile;
  if (y <= p[0].y) return [p[0].a, p[0].b];
  for (let i = 1; i < p.length; i++) {
    if (y <= p[i].y) {
      const t = smooth((y - p[i - 1].y) / (p[i].y - p[i - 1].y));
      return [p[i - 1].a + (p[i].a - p[i - 1].a) * t, p[i - 1].b + (p[i].b - p[i - 1].b) * t];
    }
  }
  const l = p[p.length - 1];
  return [l.a, l.b];
}

export function torsoPoint(spec, theta, y) {
  const [a, b] = torsoAB(spec, y);
  return [a * Math.sin(theta), y, b * Math.cos(theta)];
}
export function torsoNormal(spec, theta, y) {
  const [a, b] = torsoAB(spec, y);
  return norm([Math.sin(theta) / a, 0, Math.cos(theta) / b]);
}

export function ellipseAngleForArc(a, b, s) {
  const sign = Math.sign(s);
  const target = Math.abs(s);
  const N = 96, max = Math.PI * 0.98;
  let acc = 0, prevT = 0;
  for (let i = 1; i <= N; i++) {
    const t = (max * i) / N;
    const tm = (prevT + t) / 2;
    const seg = Math.hypot(a * Math.cos(tm), b * Math.sin(tm)) * (t - prevT);
    if (acc + seg >= target) return sign * (prevT + ((target - acc) / seg) * (t - prevT));
    acc += seg;
    prevT = t;
  }
  return sign * max;
}

const sub = (a, b) => [a[0] - b[0], a[1] - b[1], a[2] - b[2]];
const add = (a, b) => [a[0] + b[0], a[1] + b[1], a[2] + b[2]];
const mul = (a, k) => [a[0] * k, a[1] * k, a[2] * k];
export const dot = (a, b) => a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
export const cross = (a, b) => [a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0]];
export function norm(a) {
  const l = Math.hypot(a[0], a[1], a[2]) || 1;
  return [a[0] / l, a[1] / l, a[2] / l];
}

export function sleeveFrame(spec, side) {
  const al = (spec.sleeve.droopDeg * Math.PI) / 180;
  const axis = [side * Math.cos(al), -Math.sin(al), 0];
  const ref = norm([0, 0.5, 0.86]);
  const n = norm(sub(ref, mul(axis, dot(ref, axis))));
  const joint = [side * spec.sleeve.joint[0], spec.sleeve.joint[1], 0];
  return { joint, axis, n, right: cross(n, axis) };
}
export const sleeveRadius = (spec, s) =>
  spec.sleeve.rJoint + (spec.sleeve.rCuff - spec.sleeve.rJoint) * Math.min(Math.max(s / spec.sleeve.length, 0), 1);
export function sleevePoint(spec, side, s, phi) {
  const f = sleeveFrame(spec, side);
  const dir = add(mul(f.n, Math.cos(phi)), mul(f.right, Math.sin(phi)));
  return { position: add(add(f.joint, mul(f.axis, s)), mul(dir, sleeveRadius(spec, s))), normal: dir };
}

export function hoodPoint(spec, psi, beta) {
  const h = spec.hood;
  if (!h) return null;
  const c = Math.cos(beta);
  const position = [h.center[0] - h.rx * c * Math.sin(psi), h.center[1] + h.ry * Math.sin(beta), h.center[2] - h.rz * c * Math.cos(psi)];
  return { position, normal: norm([(-c * Math.sin(psi)) / h.rx, Math.sin(beta) / h.ry, (-c * Math.cos(psi)) / h.rz]) };
}
const HOOD_BETA_TOP = 0.36 * Math.PI;

export function surfaceAt(spec, placement, area, xCm, yCm) {
  const dx = xCm - area.widthCm / 2;
  switch (placement) {
    case 'Front':
    case 'Back': {
      const y = spec.printTopY - yCm;
      const [a, b] = torsoAB(spec, y);
      const theta = ellipseAngleForArc(a, b, dx);
      const t = placement === 'Back' ? theta + Math.PI : theta;
      return { position: torsoPoint(spec, t, y), normal: torsoNormal(spec, t, y) };
    }
    case 'LeftSleeve':
    case 'RightSleeve': {
      const side = placement === 'LeftSleeve' ? 1 : -1;
      const s = spec.sleeve.printStart + yCm;
      return sleevePoint(spec, side, s, dx / sleeveRadius(spec, s));
    }
    case 'Hood': {
      const h = spec.hood;
      if (!h) return null;
      const beta = HOOD_BETA_TOP - yCm / h.ry;
      return hoodPoint(spec, dx / (h.rx * Math.max(Math.cos(beta), 0.2)), beta);
    }
    default:
      return null;
  }
}

export function placementFacing(spec, areas, current, eye) {
  const score = (a) => {
    const s = surfaceAt(spec, a.placement, a, a.widthCm / 2, a.heightCm / 2);
    return s ? dot(s.normal, norm(sub(eye, s.position))) : -Infinity;
  };
  const cur = areas.find((a) => a.placement === current);
  if (cur && score(cur) > 0.25) return current;
  let best = null, bestScore = 0;
  for (const a of areas) {
    const v = score(a);
    if (v > bestScore) { best = a.placement; bestScore = v; }
  }
  return best;
}

export function cameraForPlacement(placement) {
  switch (placement) {
    case 'Back': return { azimuth: Math.PI, polar: Math.PI / 2.15 };
    case 'LeftSleeve': return { azimuth: 0.85, polar: Math.PI / 2.3 };
    case 'RightSleeve': return { azimuth: -0.85, polar: Math.PI / 2.3 };
    case 'Hood': return { azimuth: Math.PI * 0.9, polar: Math.PI / 2.6 };
    default: return { azimuth: 0, polar: Math.PI / 2.15 };
  }
}

// ---- template zones (uploaded GLB)
export function zoneFrame(normal, rotationDeg) {
  const z = norm(normal);
  const up = Math.abs(z[1]) > 0.95 ? [0, 0, -Math.sign(z[1])] : [0, 1, 0];
  const x0 = norm(cross(up, z));
  const y0 = cross(z, x0);
  const a = (rotationDeg * Math.PI) / 180, c = Math.cos(a), s = Math.sin(a);
  const x = [x0[0] * c + y0[0] * s, x0[1] * c + y0[1] * s, x0[2] * c + y0[2] * s];
  const y = [y0[0] * c - x0[0] * s, y0[1] * c - x0[1] * s, y0[2] * c - x0[2] * s];
  return { x, y, z };
}
export const zoneDepth = (z) => Math.min(30, Math.max(4, Math.max(z.widthCm, z.heightCm) * 0.6));
export function cameraForZone(normal) {
  const n = norm([normal.x, normal.y, normal.z]);
  const azimuth = Math.abs(n[0]) + Math.abs(n[2]) < 1e-3 ? 0 : Math.atan2(n[0], n[2]);
  const polar = Math.min(2.2, Math.max(0.6, Math.acos(Math.max(-1, Math.min(1, n[1])))));
  return { azimuth, polar };
}
export function zoneFacing(zones, current, eye) {
  const score = (z) => {
    const p = [z.position.x, z.position.y, z.position.z];
    return dot(norm([z.normal.x, z.normal.y, z.normal.z]), norm(sub(eye, p)));
  };
  const cur = zones.find((z) => z.code === current);
  if (cur && score(cur) > 0.25) return current;
  let best = null, bestScore = 0;
  for (const z of zones) {
    const v = score(z);
    if (v > bestScore) { best = z.code; bestScore = v; }
  }
  return best;
}
