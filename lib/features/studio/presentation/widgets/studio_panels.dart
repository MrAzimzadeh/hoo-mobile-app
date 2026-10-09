import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../../../shared/extensions/enum_labels.dart';
import '../../data/studio_repository.dart';
import '../../domain/free_layers.dart';
import '../../domain/layer_ops.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import '../../domain/spec_rules.dart';
import '../../engine/engine_protocol.dart';
import '../bloc/studio_editor_bloc.dart';
import '../bloc/studio_side_cubits.dart';
import '../pages/studio_page.dart';

/// The panel under (or beside) the 3D stage for the current step.
class StudioStepPanel extends StatelessWidget {
  const StudioStepPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final step = context.select<StudioEditorBloc, StudioStep>((b) => b.state.step);
    return AnimatedSwitcher(
      duration: context.hoo.motion(HooDurations.normal),
      switchInCurve: HooCurves.enter,
      transitionBuilder: (child, a) => FadeTransition(opacity: a, child: SlideTransition(position: Tween(begin: const Offset(0, 0.03), end: Offset.zero).animate(a), child: child)),
      child: KeyedSubtree(
        key: ValueKey(step),
        child: switch (step) {
          StudioStep.product => const _ProductPanel(),
          StudioStep.fabric => const _FabricPanel(),
          StudioStep.fit => const _FitPanel(),
          StudioStep.color => const _ColorPanel(),
          StudioStep.editor => const _EditorPanel(),
          StudioStep.review => const _ReviewPanel(),
        },
      ),
    );
  }
}

Widget _label(BuildContext context, String text) =>
    Padding(padding: const EdgeInsets.only(top: HooSpacing.md, bottom: HooSpacing.xs), child: Text(text.toUpperCase(), style: context.hoo.text.labelSecondary));

String _surcharge(BuildContext context, double v) => v == 0 ? context.l10n.studioIncluded : HooFormat.signedMoney(context, v);

// ---------------------------------------------------------------- 1 product

class _ProductPanel extends StatelessWidget {
  const _ProductPanel();

  static String _art(ProductType t) => switch (t) {
        ProductType.tShirt => 'asset:assets/images/cat-tshirts.jpg',
        ProductType.hoodie || ProductType.zipHoodie => 'asset:assets/images/cat-hoodies.jpg',
        _ => 'asset:assets/images/cat-design.jpg',
      };

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = context.watch<StudioEditorBloc>().state;
    final config = s.config!;
    return ListView(
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        Text(l.studioChooseProduct, style: context.hoo.text.h2),
        const SizedBox(height: HooSpacing.md),
        for (final (i, b) in config.baseProducts.indexed)
          HooReveal(
            index: i,
            child: Padding(
              padding: const EdgeInsets.only(bottom: HooSpacing.sm),
              child: SelectableCard(
                selected: s.spec?.baseCode == b.code,
                onTap: () => context.read<StudioEditorBloc>().add(BaseSelected(b.code)),
                child: Row(children: [
                  SizedBox(width: 72, child: AspectRatio(aspectRatio: HooSize.productImageAspect, child: HooNetworkImage(url: b.product?.imageUrl ?? _art(b.productType), borderRadius: HooRadius.cardAll, cacheWidth: 72))),
                  const SizedBox(width: HooSpacing.md),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(b.name, style: context.hoo.text.h3),
                      Text(b.productType.label(l), style: context.hoo.text.caption),
                      const SizedBox(height: HooSpacing.xxs),
                      Text(l.studioFromPrice(HooFormat.money(context, b.price)), style: context.hoo.text.bodyStrong),
                      if (b.leadTimeMaxDays > 0) Text(l.studioLeadTime(b.leadTimeMinDays, b.leadTimeMaxDays), style: context.hoo.text.caption),
                    ]),
                  ),
                ]),
              ),
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------- 2 fabric & features

class _FabricPanel extends StatelessWidget {
  const _FabricPanel();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = context.watch<StudioEditorBloc>().state;
    final config = s.config!, base = s.base!, spec = s.spec!;
    final bloc = context.read<StudioEditorBloc>();
    final features = config.featuresFor(base);
    return ListView(
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        Text(l.studioFabric, style: context.hoo.text.h2),
        const SizedBox(height: HooSpacing.md),
        for (final f in config.fabricsFor(base))
          Padding(
            padding: const EdgeInsets.only(bottom: HooSpacing.sm),
            child: SelectableCard(
              selected: spec.fabricCode == f.code,
              onTap: () => bloc.add(FabricSelected(f.code)),
              child: Row(children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(f.name, style: context.hoo.text.bodyStrong),
                    if (f.gsm != null) Text(l.studioGsm(f.gsm!), style: context.hoo.text.caption),
                  ]),
                ),
                Text(f.included ? l.studioIncluded : _surcharge(context, f.surcharge), style: context.hoo.text.captionPrimary),
              ]),
            ),
          ),
        if (features.isNotEmpty) ...[
          _label(context, l.studioFeatures),
          Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
            for (final f in features)
              OptionChip(label: f.name, uppercase: false, style: OptionChipStyle.tint, selected: spec.featureCodes.contains(f.code), trailing: _surcharge(context, f.surcharge), onTap: () => bloc.add(FeatureToggled(f.code))),
          ]),
        ],
      ],
    );
  }
}

// ---------------------------------------------------------------- 3 size & fit

class _FitPanel extends StatefulWidget {
  const _FitPanel();

  @override
  State<_FitPanel> createState() => _FitPanelState();
}

class _FitPanelState extends State<_FitPanel> {
  late final _spec = context.read<StudioEditorBloc>().state.spec!;
  late bool _custom = _spec.customMeasurements != null;
  late final _chest = TextEditingController(text: _spec.customMeasurements?.chestCm.toString() ?? '');
  late final _length = TextEditingController(text: _spec.customMeasurements?.lengthCm.toString() ?? '');
  late final _sleeve = TextEditingController(text: _spec.customMeasurements?.sleeveCm.toString() ?? '');

  @override
  void dispose() {
    _chest.dispose();
    _length.dispose();
    _sleeve.dispose();
    super.dispose();
  }

  void _pushMeasurements() {
    final c = int.tryParse(_chest.text), le = int.tryParse(_length.text), sl = int.tryParse(_sleeve.text);
    if (c == null || le == null || sl == null) return;
    context.read<StudioEditorBloc>().add(MeasurementsSet(CustomMeasurements(chestCm: c, lengthCm: le, sleeveCm: sl)));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = context.watch<StudioEditorBloc>().state;
    final config = s.config!, base = s.base!, spec = s.spec!;
    final bloc = context.read<StudioEditorBloc>();
    return ListView(
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        Text(l.studioFit, style: context.hoo.text.h2),
        const SizedBox(height: HooSpacing.sm),
        Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
          for (final f in base.fits.where((f) => f != Fit.unknown))
            OptionChip(label: f.label(l), uppercase: false, style: OptionChipStyle.tint, selected: spec.fit == f, trailing: _surcharge(context, config.fit(f)?.surcharge ?? 0), onTap: () => bloc.add(FitSelected(f))),
        ]),
        _label(context, l.catalogSize),
        Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
          for (final size in base.sizes.where((x) => x != Size.unknown))
            OptionChip(
              label: size.label,
              selected: !_custom && spec.size == size,
              unavailable: !variantAvailable(base, spec.colorId, size),
              trailing: (config.sizeSurcharge(size) ?? 0) > 0 ? HooFormat.signedMoney(context, config.sizeSurcharge(size)!) : null,
              onTap: () {
                setState(() => _custom = false);
                bloc.add(SizeSelected(size));
              },
            ),
        ]),
        if (!base.isCatalog) ...[
          const SizedBox(height: HooSpacing.md),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            value: _custom,
            onChanged: (v) {
              setState(() => _custom = v);
              if (v) {
                _pushMeasurements();
              } else {
                bloc.add(const MeasurementsSet(null));
              }
            },
            title: Text(l.studioCustomMeasurements, style: context.hoo.text.body),
            subtitle: Text(_surcharge(context, config.extras.customMeasurementsFee), style: context.hoo.text.caption),
          ),
          if (_custom)
            Row(children: [
              for (final (c, label) in [(_chest, l.catalogChestCol), (_length, l.catalogLengthCol), (_sleeve, l.catalogSleeveCol)]) ...[
                Expanded(child: HooTextField(controller: c, label: '$label, cm', keyboardType: TextInputType.number, onChanged: (_) => _pushMeasurements())),
                if (c != _sleeve) const SizedBox(width: HooSpacing.sm),
              ],
            ]),
        ],
      ],
    );
  }
}

// ---------------------------------------------------------------- 4 color

class _ColorPanel extends StatelessWidget {
  const _ColorPanel();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = context.watch<StudioEditorBloc>().state;
    final base = s.base!, spec = s.spec!;
    final selected = base.color(spec.colorId);
    return ListView(
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        Text(l.studioColor, style: context.hoo.text.h2),
        if (selected != null) Text(selected.name, style: context.hoo.text.bodySecondary),
        const SizedBox(height: HooSpacing.md),
        Wrap(children: [
          for (final c in base.colors)
            HooColorSwatch(
              hex: c.hex,
              name: c.name,
              size: 40,
              selected: c.id == spec.colorId,
              available: colorAvailable(base, c.id),
              onTap: colorAvailable(base, c.id) ? () => context.read<StudioEditorBloc>().add(ColorSelected(c.id)) : null,
            ),
        ]),
      ],
    );
  }
}

// ---------------------------------------------------------------- 5 editor

class _EditorPanel extends StatelessWidget {
  const _EditorPanel();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = context.watch<StudioEditorBloc>().state;
    final base = s.base!;
    final bloc = context.read<StudioEditorBloc>();
    final upload = context.watch<UploadCubit>().state;
    final selected = s.selected;
    final zoneNames = {for (final z in base.template?.zones ?? const <TemplateZone>[]) z.code: z.name};
    return ListView(
      padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.sm, HooSpacing.screen, HooSpacing.lg),
      children: [
        SizedBox(
          height: 44,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            for (final a in base.printAreas)
              Padding(
                padding: const EdgeInsets.only(right: HooSpacing.xs),
                child: OptionChip(
                  label: placementLabel(l, a.placement, zoneName: zoneNames[a.placement]),
                  uppercase: false,
                  selected: s.activePlacement == a.placement,
                  trailing: () {
                    final n = s.layers.where((x) => x.placement == a.placement).length;
                    return n == 0 ? null : '$n';
                  }(),
                  onTap: () => bloc.add(PlacementActivated(a.placement)),
                ),
              ),
          ]),
        ),
        if (s.spot != null || s.surfaceSpot != null)
          Padding(padding: const EdgeInsets.only(top: HooSpacing.xs), child: Text(l.studioSpotPicked, style: context.hoo.text.caption.copyWith(color: context.hoo.colors.accent))),
        const SizedBox(height: HooSpacing.sm),
        Row(children: [
          Expanded(child: SecondaryButton(label: l.studioAddText, icon: HooIcons.text, onPressed: () => showTextSheet(context))),
          const SizedBox(width: HooSpacing.sm),
          Expanded(
            child: SecondaryButton(
              label: upload.uploading ? '${(upload.progress * 100).round()}%' : l.studioAddImage,
              icon: HooIcons.image,
              loading: upload.uploading && upload.progress == 0,
              onPressed: upload.uploading ? null : () => _pickImage(context, s.config!),
            ),
          ),
        ]),
        if (upload.uploading) ...[
          const SizedBox(height: HooSpacing.xs),
          LinearProgressIndicator(value: upload.progress == 0 ? null : upload.progress, minHeight: 2, color: context.hoo.colors.accent),
        ],
        if (selected != null) ...[const SizedBox(height: HooSpacing.md), _Inspector(layer: selected)],
        _label(context, l.studioLayers(s.layers.length, s.maxLayers)),
        if (s.layers.isEmpty)
          Text(l.studioNoLayers, style: context.hoo.text.bodySecondary)
        else
          ReorderableListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            buildDefaultDragHandles: false,
            onReorder: (from, to) {
              final ordered = [...s.layers]..sort((a, b) => b.zIndex.compareTo(a.zIndex));
              final layer = ordered[from];
              final stack = layersForPlacement(s.layers, layer.placement);
              // the list shows top first; reorderStack takes a bottom-up index within the placement
              final target = ordered[to > from ? to - 1 : to];
              final idx = stack.indexWhere((x) => x.id == target.id);
              if (idx >= 0) bloc.add(LayerReordered(layer.id, idx));
            },
            children: [
              for (final (i, layer) in ([...s.layers]..sort((a, b) => b.zIndex.compareTo(a.zIndex))).indexed)
                _LayerRow(key: ValueKey(layer.id), index: i, layer: layer, selected: layer.id == s.selectedId, hidden: s.hidden.contains(layer.id), zoneNames: zoneNames),
            ],
          ),
      ],
    );
  }

  Future<void> _pickImage(BuildContext context, StudioConfig config) async {
    final l = context.l10n;
    final cubit = context.read<UploadCubit>();
    final source = await showHooSheet<ImageSource>(
      context,
      title: l.studioAddImage,
      builder: (ctx) => Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(l.studioUploadHint(config.maxUploadMegabytes, config.recommendedDpi), style: ctx.hoo.text.caption),
        const SizedBox(height: HooSpacing.md),
        PrimaryButton(label: l.studioFromGallery, icon: HooIcons.image, onPressed: () => Navigator.of(ctx).pop(ImageSource.gallery)),
        const SizedBox(height: HooSpacing.sm),
        SecondaryButton(label: l.studioFromCamera, icon: HooIcons.camera, onPressed: () => Navigator.of(ctx).pop(ImageSource.camera)),
      ]),
    );
    if (source != null) await cubit.pick(source, maxMegabytes: config.maxUploadMegabytes);
  }
}

class _LayerRow extends StatelessWidget {
  const _LayerRow({super.key, required this.index, required this.layer, required this.selected, required this.hidden, required this.zoneNames});

  final int index;
  final DesignLayer layer;
  final bool selected;
  final bool hidden;
  final Map<String, String> zoneNames;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bloc = context.read<StudioEditorBloc>();
    final c = context.hoo.colors;
    return Material(
      color: selected ? c.accentTint : Colors.transparent,
      borderRadius: HooRadius.cardAll,
      child: InkWell(
        borderRadius: HooRadius.cardAll,
        onTap: () => bloc.add(LayerSelected(layer.id)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: HooSpacing.xs, vertical: HooSpacing.xxs),
          child: Row(children: [
            ReorderableDragStartListener(index: index, child: Padding(padding: const EdgeInsets.all(HooSpacing.xs), child: Icon(HooIcons.dragHandle, size: 18, color: c.textTertiary))),
            Icon(layer.kind == LayerKind.text ? HooIcons.text : HooIcons.image, size: 18),
            const SizedBox(width: HooSpacing.sm),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(layer.kind == LayerKind.text ? (layer.text ?? '') : l.studioImageLayer, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.hoo.text.body.copyWith(color: hidden ? c.textTertiary : null)),
                Text('${placementLabel(l, layer.placement, zoneName: zoneNames[layer.placement])} · ${layer.widthCm.toStringAsFixed(1)}×${layer.heightCm.toStringAsFixed(1)} cm', style: context.hoo.text.caption),
              ]),
            ),
            HooIconButton(icon: hidden ? HooIcons.eyeOff : HooIcons.eye, size: 18, semanticLabel: hidden ? l.studioShowLayer : l.studioHideLayer, onPressed: () => bloc.add(LayerVisibilityToggled(layer.id))),
          ]),
        ),
      ),
    );
  }
}

/// Selected-layer tools: size, rotation, center, duplicate, delete, edit text, print quality.
class _Inspector extends StatefulWidget {
  const _Inspector({required this.layer});
  final DesignLayer layer;

  @override
  State<_Inspector> createState() => _InspectorState();
}

class _InspectorState extends State<_Inspector> {
  double _scale = 1;

  @override
  void didUpdateWidget(_Inspector old) {
    super.didUpdateWidget(old);
    if (old.layer.id != widget.layer.id) _scale = 1;
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final layer = widget.layer;
    final bloc = context.read<StudioEditorBloc>();
    final quote = context.watch<PricingCubit>().state.quote;
    final warning = quote?.warningFor(layer.id);
    final upload = layer.uploadId == null ? null : context.select<StudioEditorBloc, DesignUpload?>((b) => b.state.uploads[layer.uploadId]);
    final dpi = warning?.effectiveDpi ?? (upload == null ? null : effectiveDpi(upload, layer));
    return HooCard(
      padding: const EdgeInsets.fromLTRB(HooSpacing.md, HooSpacing.xs, HooSpacing.xs, HooSpacing.xs),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Expanded(child: Text(layer.kind == LayerKind.text ? l.studioTextLayer : l.studioImageLayer, style: context.hoo.text.bodyStrong)),
          if (layer.kind == LayerKind.text) HooIconButton(icon: HooIcons.edit, size: 20, semanticLabel: l.commonEdit, onPressed: () => showTextSheet(context, editing: layer)),
          HooIconButton(icon: HooIcons.target, size: 20, semanticLabel: l.studioCenter, onPressed: isFreeLayer(layer) ? null : () => bloc.add(LayerCentered(layer.id))),
          HooIconButton(icon: HooIcons.copy, size: 20, semanticLabel: l.studioDuplicate, onPressed: () => bloc.add(LayerDuplicated(layer.id))),
          HooIconButton(icon: HooIcons.trash, size: 20, semanticLabel: l.commonDelete, onPressed: () => bloc.add(LayerDeleted(layer.id))),
        ]),
        Row(children: [
          SizedBox(width: 64, child: Text(l.studioSize, style: context.hoo.text.caption)),
          Expanded(
            child: Slider(
              min: 0.3,
              max: 2.5,
              value: _scale.clamp(0.3, 2.5),
              onChangeStart: (_) => bloc.add(LayerGestureStarted(layer.id)),
              onChanged: (v) {
                final factor = v / _scale;
                setState(() => _scale = v);
                bloc.add(LayerScaled(layer.id, factor, live: true));
              },
              onChangeEnd: (_) => bloc.add(LayerGestureEnded(layer.id)),
            ),
          ),
        ]),
        Row(children: [
          SizedBox(width: 64, child: Text(l.studioRotation, style: context.hoo.text.caption)),
          Expanded(
            child: Slider(
              min: -180,
              max: 180,
              divisions: 72,
              value: layer.rotation.clamp(-180, 180),
              label: '${layer.rotation.round()}°',
              onChanged: (v) => bloc.add(LayerRotated(layer.id, v)),
            ),
          ),
        ]),
        if (dpi != null)
          Padding(
            padding: const EdgeInsets.only(bottom: HooSpacing.xs, right: HooSpacing.sm),
            child: InlineAlert(
              kind: switch (warning?.quality) { PrintQuality.poor => HooAlertKind.error, PrintQuality.warning => HooAlertKind.warning, _ => HooAlertKind.success },
              message: switch (warning?.quality) {
                PrintQuality.poor => l.studioQualityPoor(dpi),
                PrintQuality.warning => l.studioQualityWarning(dpi),
                _ => l.studioQualityOk(dpi),
              },
            ),
          ),
      ]),
    );
  }
}

/// Add or edit a text layer: content, font, colour, size, alignment.
Future<void> showTextSheet(BuildContext context, {DesignLayer? editing}) {
  final bloc = context.read<StudioEditorBloc>();
  return showHooSheet<void>(
    context,
    title: editing == null ? context.l10n.studioAddText : context.l10n.studioEditText,
    builder: (_) => BlocProvider.value(value: bloc, child: _TextSheet(editing: editing)),
  );
}

class _TextSheet extends StatefulWidget {
  const _TextSheet({this.editing});
  final DesignLayer? editing;

  @override
  State<_TextSheet> createState() => _TextSheetState();
}

class _TextSheetState extends State<_TextSheet> {
  late final _text = TextEditingController(text: widget.editing?.text ?? '');
  late String? _font = widget.editing?.font;
  late String _color = widget.editing?.colorHex ?? LayerRules.defaultTextColor;
  late double _size = widget.editing?.fontSizePt ?? 48;
  late String _align = widget.editing?.align ?? 'center';

  static const _palette = ['#121212', '#FFFFFF', '#1C3829', '#EDE6D6', '#B83636', '#9A9A9A', '#D6C7AD', '#2B4C7E'];

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void _apply() {
    final bloc = context.read<StudioEditorBloc>();
    final text = _text.text.trim();
    if (text.isEmpty) return;
    if (widget.editing == null) {
      bloc.add(TextLayerAdded(text: text, font: _font, colorHex: _color, fontSizePt: _size, align: _align));
    } else {
      bloc.add(TextLayerEdited(widget.editing!.id, text: text, font: _font, colorHex: _color, fontSizePt: _size, align: _align));
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final fonts = context.read<StudioEditorBloc>().state.config?.fonts ?? const <String>[];
    return ListView(
      shrinkWrap: true,
      children: [
        HooTextField(controller: _text, hint: 'HOO', maxLines: 3, minLines: 1, maxLength: LayerRules.maxTextLength, autofocus: widget.editing == null),
        if (fonts.isNotEmpty) ...[
          _label(context, l.studioFont),
          Wrap(spacing: HooSpacing.xs, runSpacing: HooSpacing.xs, children: [
            for (final f in fonts) OptionChip(label: f, uppercase: false, style: OptionChipStyle.tint, selected: (_font ?? fonts.first) == f, onTap: () => setState(() => _font = f)),
          ]),
        ],
        _label(context, l.catalogColor),
        Wrap(children: [
          for (final hex in _palette) HooColorSwatch(hex: hex, name: hex, selected: _color.toUpperCase() == hex, onTap: () => setState(() => _color = hex)),
        ]),
        _label(context, l.studioTextSize(_size.round())),
        Slider(min: LayerRules.minFontPt, max: LayerRules.maxFontPt, value: _size.clamp(LayerRules.minFontPt, LayerRules.maxFontPt), onChanged: (v) => setState(() => _size = v)),
        Row(children: [
          for (final (a, icon) in [('left', HooIcons.alignLeft), ('center', HooIcons.alignCenter), ('right', HooIcons.alignRight)])
            HooIconButton(icon: icon, semanticLabel: a, color: _align == a ? context.hoo.colors.accent : null, onPressed: () => setState(() => _align = a)),
        ]),
        const SizedBox(height: HooSpacing.md),
        ListenableBuilder(listenable: _text, builder: (context, _) => PrimaryButton(label: widget.editing == null ? l.studioAddText : l.commonSave, onPressed: _text.text.trim().isEmpty ? null : _apply)),
      ],
    );
  }
}

// ---------------------------------------------------------------- 6 review

class _ReviewPanel extends StatefulWidget {
  const _ReviewPanel();

  @override
  State<_ReviewPanel> createState() => _ReviewPanelState();
}

class _ReviewPanelState extends State<_ReviewPanel> {
  Map<String, String> _mockups = const {};
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _snap());
  }

  Future<void> _snap() async {
    final engine = context.read<EngineRef>().controller;
    if (engine == null) return;
    final m = await engine.snapshot();
    if (mounted) setState(() => _mockups = m);
  }

  Future<String?> _save({required bool withMockups}) async {
    final s = context.read<StudioEditorBloc>().state;
    final autosave = context.read<AutosaveCubit>();
    final id = await autosave.flush(confirmImageRights: s.doc!.hasImages ? s.imageRightsConfirmed : null);
    if (id == null) return null;
    if (withMockups) {
      final repo = sl<StudioRepository>();
      for (final e in (_mockups.isEmpty ? await _snapAndReturn() : _mockups).entries) {
        final bytes = base64Decode(e.value.split(',').last);
        await repo.uploadMockup(id, bytes, name: e.key);
      }
    }
    return id;
  }

  Future<Map<String, String>> _snapAndReturn() async {
    await _snap();
    return _mockups;
  }

  Future<void> _run(Future<void> Function() task) async {
    setState(() => _busy = true);
    try {
      await task();
    } on ApiException catch (e) {
      if (mounted) HooToast.error(context, e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = context.watch<StudioEditorBloc>().state;
    final q = context.watch<PricingCubit>().state.quote;
    final bloc = context.read<StudioEditorBloc>();
    final config = s.config!, base = s.base!, spec = s.spec!;
    final needsRights = s.doc!.hasImages;
    final ready = specHasSize(spec) && (!needsRights || s.imageRightsConfirmed) && s.layers.isNotEmpty;
    final summary = [
      (l.studioStepProduct, base.name),
      (l.studioFabric, config.fabric(spec.fabricCode)?.name ?? spec.fabricCode),
      (l.studioFit, spec.fit.label(l)),
      (l.catalogSize, sizeLabel(l, spec)),
      (l.studioColor, base.color(spec.colorId)?.name ?? ''),
      if (spec.featureCodes.isNotEmpty) (l.studioFeatures, spec.featureCodes.map((c) => config.feature(c)?.name ?? c).join(', ')),
    ];
    return ListView(
      padding: const EdgeInsets.all(HooSpacing.screen),
      children: [
        if (s.changeRequestMessage != null) ...[InlineAlert(kind: HooAlertKind.warning, title: l.designStatusChangesRequested, message: s.changeRequestMessage!), const SizedBox(height: HooSpacing.md)],
        if (_mockups.isNotEmpty)
          SizedBox(
            height: 220,
            child: Row(children: [
              for (final e in _mockups.entries) ...[
                Expanded(child: ClipRRect(borderRadius: HooRadius.cardAll, child: ColoredBox(color: context.hoo.colors.surface, child: Image.memory(base64Decode(e.value.split(',').last), fit: BoxFit.contain)))),
                if (e.key != _mockups.keys.last) const SizedBox(width: HooSpacing.sm),
              ],
            ]),
          ),
        const SizedBox(height: HooSpacing.md),
        for (final (k, v) in summary) SummaryRow(label: k, value: v),
        SummaryRow(label: l.studioLayersShort, value: '${s.layers.length}'),
        if (s.editable) ...[
          _label(context, l.studioQuantity),
          Row(children: [
            QuantityStepper(value: spec.quantity, max: maxQuantityFor(base), onChanged: (v) => bloc.add(QuantityChanged(v))),
            const SizedBox(width: HooSpacing.md),
            if (config.extras.volumeTiers.isNotEmpty)
              Expanded(child: Text(config.extras.volumeTiers.map((t) => l.studioVolumeTier(t.minQuantity, t.percent.round())).join(' · '), style: context.hoo.text.caption)),
          ]),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            value: spec.rush,
            onChanged: (v) => bloc.add(RushToggled(v)),
            title: Text(l.studioRush, style: context.hoo.text.body),
            subtitle: Text(l.studioRushHint(HooFormat.money(context, config.extras.rushFee), config.extras.rushLeadTimeDays), style: context.hoo.text.caption),
          ),
        ],
        if (q?.estimatedDeliveryFrom != null && q?.estimatedDeliveryTo != null)
          Padding(
            padding: const EdgeInsets.only(top: HooSpacing.xs),
            child: Text(l.checkoutEstimatedDelivery(HooFormat.dateRange(context, q!.estimatedDeliveryFrom!, q.estimatedDeliveryTo!)), style: context.hoo.text.captionPrimary),
          ),
        const SizedBox(height: HooSpacing.md),
        InlineAlert(message: l.checkoutCustomApprovalNote),
        if (needsRights && s.editable) HooCheckboxTile(value: s.imageRightsConfirmed, onChanged: (v) => bloc.add(ImageRightsConfirmed(v)), label: Text(l.studioImageRights)),
        if (s.layers.isEmpty) Padding(padding: const EdgeInsets.only(top: HooSpacing.sm), child: Text(l.studioAddSomething, style: context.hoo.text.caption.copyWith(color: context.hoo.colors.error))),
        const SizedBox(height: HooSpacing.lg),
        if (s.editable) ...[
          PrimaryButton.accent(
            label: l.catalogAddToBag,
            loading: _busy,
            onPressed: !ready || _busy
                ? null
                : () => _run(() async {
                      final id = await _save(withMockups: true);
                      if (id == null || !context.mounted) return;
                      final bag = sl<BagService>();
                      await bag.addDesign(id, quantity: spec.quantity);
                      if (context.mounted) await bag.showAddedSheet(context);
                    }),
          ),
          const SizedBox(height: HooSpacing.sm),
          SecondaryButton(
            label: l.studioSaveDesign,
            onPressed: _busy
                ? null
                : () => _run(() async {
                      final id = await _save(withMockups: true);
                      if (id != null && context.mounted) HooToast.success(context, l.studioDesignSaved);
                    }),
          ),
          const SizedBox(height: HooSpacing.xs),
          Center(child: HooTextButton(label: l.studioBackToEditor, onPressed: () => bloc.add(const StudioStepChanged(StudioStep.editor)))),
        ],
      ],
    );
  }
}
