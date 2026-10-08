import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/layer_math.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import '../../domain/models/studio_responses.dart';
import '../bloc/pricing_cubit.dart';
import '../bloc/studio_editor_bloc.dart';
import '../bloc/uploads_cubit.dart';
import 'studio_steps.dart';

String placementLabel(BuildContext context, StudioBase base, String placement) {
  final server = base.zoneName(placement);
  if (server != null && server.isNotEmpty) return server;
  final l = context.l10n;
  return switch (placement.toLowerCase().replaceAll(RegExp(r'[-_ ]'), '')) {
    'front' => l.studioZoneFront,
    'back' => l.studioZoneBack,
    'leftsleeve' => l.studioZoneLeftSleeve,
    'rightsleeve' => l.studioZoneRightSleeve,
    'hood' => l.studioZoneHood,
    _ => placement,
  };
}

/// Step 5 — the editor controls under the 3D view: zones, add text / image, layers and the selected layer's tools.
class EditorPanel extends StatelessWidget {
  const EditorPanel({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final cubit = context.read<UploadsCubit>();
    final source = await showHooSheet<PickSource>(
      context,
      title: context.l10n.studioUploadImage,
      builder: (sheet) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HooListTile(title: context.l10n.studioFromGallery, icon: HooIcons.image, onTap: () => Navigator.of(sheet).pop(PickSource.gallery)),
          HooListTile(title: context.l10n.studioFromCamera, icon: HooIcons.image, onTap: () => Navigator.of(sheet).pop(PickSource.camera)),
        ],
      ),
    );
    if (source != null) await cubit.pick(source);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final editor = context.read<StudioEditorBloc>();
    return BlocBuilder<StudioEditorBloc, StudioEditorState>(
      builder: (context, state) {
        final base = state.base;
        final config = state.config;
        if (base == null || config == null) return const SizedBox.shrink();
        final quote = context.watch<PricingCubit>().state.quote;
        final selected = state.selectedLayer;
        final areas = base.areas;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.changeRequestMessage != null) Padding(padding: const EdgeInsets.only(bottom: HooSpacing.md), child: InlineAlert(title: l.studioChangesRequested, message: state.changeRequestMessage!, kind: HooAlertKind.warning)),
            if (state.readOnly) Padding(padding: const EdgeInsets.only(bottom: HooSpacing.md), child: InlineAlert(message: l.studioNotEditable)),
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: areas.length,
                separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.xs),
                itemBuilder: (_, i) {
                  final a = areas[i];
                  return OptionChip(label: placementLabel(context, base, a.placement), uppercase: false, selected: a.placement == state.activePlacement, onTap: () => editor.add(PlacementSelected(a.placement)));
                },
              ),
            ),
            const SizedBox(height: HooSpacing.sm),
            if (!state.readOnly)
              Row(
                children: [
                  Expanded(child: SecondaryButton(label: l.studioAddText, icon: HooIcons.text, onPressed: state.canAddLayer ? () => editor.add(const TextLayerAdded()) : null)),
                  const SizedBox(width: HooSpacing.sm),
                  Expanded(
                    child: BlocBuilder<UploadsCubit, UploadsState>(
                      builder: (context, up) => SecondaryButton(label: up.uploading ? l.studioUploading((up.progress * 100).round()) : l.studioUploadImage, icon: HooIcons.image, loading: up.uploading, onPressed: state.canAddLayer && !up.uploading ? () => _pickImage(context) : null),
                    ),
                  ),
                ],
              ),
            BlocBuilder<UploadsCubit, UploadsState>(
              builder: (context, up) {
                if (up.uploading) {
                  return Padding(
                    padding: const EdgeInsets.only(top: HooSpacing.xs),
                    child: Row(children: [Expanded(child: LinearProgressIndicator(value: up.progress, color: c.accent, backgroundColor: c.border)), TextButton(onPressed: context.read<UploadsCubit>().cancel, child: Text(l.commonCancel))]),
                  );
                }
                final problem = up.problem;
                if (problem == null) return const SizedBox.shrink();
                final message = switch (problem) {
                  UploadProblem.tooLarge => l.studioUploadTooLarge(state.config?.maxUploadMegabytes ?? 20),
                  UploadProblem.unsupported => l.studioUploadUnsupported,
                  UploadProblem.failed => up.error != null ? errorMessage(context, up.error!) : l.errorGeneric,
                };
                return Padding(padding: const EdgeInsets.only(top: HooSpacing.sm), child: InlineAlert(message: message, kind: HooAlertKind.error, action: l.commonClose, onAction: context.read<UploadsCubit>().dismissProblem));
              },
            ),
            const SizedBox(height: HooSpacing.md),
            Text(l.studioLayers(state.layers.length, config.maxLayers), style: t.bodyStrong),
            const SizedBox(height: HooSpacing.xs),
            if (state.layers.isEmpty)
              Text(l.studioNoLayers, style: t.caption.copyWith(color: c.textSecondary))
            else
              Wrap(
                spacing: HooSpacing.xs,
                runSpacing: HooSpacing.xs,
                children: [
                  for (final layer in state.layers)
                    OptionChip(
                      label: layer.isText ? (layer.text ?? '') : l.studioImageLayer,
                      uppercase: false,
                      minWidth: 0,
                      leading: Icon(layer.isText ? HooIcons.text : HooIcons.image, size: HooSize.iconSmall),
                      trailing: quote?.warningFor(layer.id) != null ? '!' : null,
                      selected: layer.id == state.selectedLayerId,
                      onTap: () => editor.add(LayerSelected(layer.id == state.selectedLayerId ? null : layer.id)),
                    ),
                ],
              ),
            if (selected != null && !state.readOnly) ...[
              const SizedBox(height: HooSpacing.md),
              _LayerTools(key: ValueKey(selected.id), layer: selected, config: config, base: base, quote: quote),
            ],
          ],
        );
      },
    );
  }
}

class _LayerTools extends StatefulWidget {
  const _LayerTools({super.key, required this.layer, required this.config, required this.base, required this.quote});

  final DesignLayer layer;
  final StudioConfig config;
  final StudioBase base;
  final StudioQuote? quote;

  @override
  State<_LayerTools> createState() => _LayerToolsState();
}

class _LayerToolsState extends State<_LayerTools> {
  late final _text = TextEditingController(text: widget.layer.text);

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void _edit(DesignLayer Function(DesignLayer) f, {String? key}) => context.read<StudioEditorBloc>().add(LayerEdited(widget.layer.id, f, coalesceKey: key));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = context.hoo.text;
    final c = context.hoo.colors;
    final layer = widget.layer;
    final area = widget.base.area(layer.placement);
    final editor = context.read<StudioEditorBloc>();
    final warning = widget.quote?.warningFor(layer.id);
    final maxWidth = area == null ? LayerMath.maxLayerCm : (area.widthCm < LayerMath.maxLayerCm ? area.widthCm : LayerMath.maxLayerCm);
    return HooCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (warning != null)
            Padding(
              padding: const EdgeInsets.only(bottom: HooSpacing.sm),
              child: InlineAlert(
                kind: warning.quality == PrintQuality.poor ? HooAlertKind.error : HooAlertKind.warning,
                message: warning.quality == PrintQuality.poor ? l.studioQualityPoor(warning.effectiveDpi) : l.studioQualityWarning(warning.effectiveDpi),
              ),
            ),
          if (layer.isText) ...[
            HooTextField(
              controller: _text,
              label: l.studioTextContent,
              maxLines: 3,
              minLines: 1,
              maxLength: LayerMath.maxTextLength,
              onChanged: (v) => _edit((x) => x.copyWith(text: v), key: 'text'),
            ),
            const SizedBox(height: HooSpacing.sm),
            if (widget.config.fonts.isNotEmpty)
              SizedBox(
                height: 44,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.config.fonts.length,
                  separatorBuilder: (_, _) => const SizedBox(width: HooSpacing.xs),
                  itemBuilder: (_, i) {
                    final f = widget.config.fonts[i];
                    return OptionChip(label: f, uppercase: false, selected: f == layer.font, onTap: () => _edit((x) => x.copyWith(font: f)));
                  },
                ),
              ),
            const SizedBox(height: HooSpacing.sm),
            Wrap(
              spacing: HooSpacing.xs,
              runSpacing: HooSpacing.xs,
              children: [
                for (final hex in LayerMath.textColors)
                  HooColorSwatch(hex: hex, name: hex, size: 28, selected: (layer.colorHex ?? '').toLowerCase() == hex.toLowerCase(), onTap: () => _edit((x) => x.copyWith(colorHex: hex))),
              ],
            ),
            const SizedBox(height: HooSpacing.sm),
            Row(
              children: [
                for (final (align, icon) in const [('left', Icons.format_align_left), ('center', Icons.format_align_center), ('right', Icons.format_align_right)])
                  IconButton(onPressed: () => _edit((x) => x.copyWith(align: align)), icon: Icon(icon, color: (layer.align ?? 'center') == align ? c.accent : c.textSecondary), tooltip: align),
              ],
            ),
            _SliderRow(
              label: l.studioFontSize,
              value: (layer.fontSizePt ?? 24).clamp(LayerMath.minFontPt, 200),
              min: LayerMath.minFontPt,
              max: 200,
              suffix: 'pt',
              onChanged: (v) => _edit((x) => x.copyWith(fontSizePt: v.roundToDouble()), key: 'size'),
            ),
          ] else
            _SliderRow(
              label: l.studioSize,
              value: layer.widthCm.clamp(LayerMath.minLayerCm, maxWidth),
              min: LayerMath.minLayerCm,
              max: maxWidth,
              suffix: 'cm',
              onChanged: (v) => _edit((x) => LayerMath.scaleAroundCenter(x, v / x.widthCm), key: 'size'),
            ),
          _SliderRow(label: l.studioRotation, value: layer.rotation.clamp(-180, 180), min: -180, max: 180, suffix: '°', onChanged: (v) => _edit((x) => x.copyWith(rotation: LayerMath.snapRotation(v)), key: 'rotation')),
          Text('${layer.widthCm.toStringAsFixed(1)} × ${layer.heightCm.toStringAsFixed(1)} cm', style: t.caption.copyWith(color: c.textSecondary)),
          const SizedBox(height: HooSpacing.sm),
          Wrap(
            spacing: HooSpacing.xs,
            children: [
              if (area != null) TextButton.icon(onPressed: () => _edit((x) => LayerMath.center(x, area)), icon: const Icon(Icons.center_focus_strong_outlined, size: HooSize.iconSmall), label: Text(l.studioCenter)),
              TextButton.icon(onPressed: () => editor.add(LayerReordered(layer.id, 1 << 20)), icon: const Icon(Icons.flip_to_front_outlined, size: HooSize.iconSmall), label: Text(l.studioBringForward)),
              TextButton.icon(onPressed: () => editor.add(LayerReordered(layer.id, 0)), icon: const Icon(Icons.flip_to_back_outlined, size: HooSize.iconSmall), label: Text(l.studioSendBack)),
              TextButton.icon(onPressed: () => editor.add(LayerDuplicated(layer.id)), icon: const Icon(Icons.copy_outlined, size: HooSize.iconSmall), label: Text(l.studioDuplicate)),
              TextButton.icon(onPressed: () => editor.add(LayerDeleted(layer.id)), icon: Icon(HooIcons.trash, size: HooSize.iconSmall, color: c.error), label: Text(l.commonDelete, style: t.body.copyWith(color: c.error))),
            ],
          ),
        ],
      ),
    );
  }
}

class _SliderRow extends StatelessWidget {
  const _SliderRow({required this.label, required this.value, required this.min, required this.max, required this.suffix, required this.onChanged});

  final String label;
  final double value;
  final double min;
  final double max;
  final String suffix;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final t = context.hoo.text;
    return Row(
      children: [
        SizedBox(width: 84, child: Text(label, style: t.caption)),
        Expanded(child: Slider(value: value.clamp(min, max), min: min, max: max, activeColor: context.hoo.colors.accent, onChanged: onChanged)),
        SizedBox(width: 56, child: Text('${value.toStringAsFixed(value >= 20 || suffix == '°' ? 0 : 1)}$suffix', style: t.caption, textAlign: TextAlign.end)),
      ],
    );
  }
}
