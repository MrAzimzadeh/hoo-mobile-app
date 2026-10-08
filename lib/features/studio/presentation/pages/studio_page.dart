import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../data/template_model_loader.dart';
import '../../domain/layer_math.dart';
import '../../domain/models/studio_config.dart';
import '../bloc/add_to_bag_cubit.dart';
import '../bloc/autosave_cubit.dart';
import '../bloc/pricing_cubit.dart';
import '../bloc/studio_editor_bloc.dart';
import '../bloc/uploads_cubit.dart';
import '../engine/studio_engine_controller.dart';
import '../engine/studio_engine_view.dart';
import '../widgets/editor_panel.dart';
import '../widgets/review_panel.dart';
import '../widgets/studio_steps.dart';

/// "Design your own": five steps (product → fabric → size & fit → colour → editor) and a review, with the 3D
/// garment staying on screen throughout. The page wires the editor to pricing, autosave, uploads and the engine.
@RoutePage()
class StudioPage extends StatelessWidget {
  const StudioPage({super.key, @QueryParam('product') this.productSlug, @QueryParam('design') this.designId});

  /// Opened from a PDP via "Customize this" → base `p-<productId>` resolved from the slug.
  final String? productSlug;

  /// Resume/edit an existing design.
  final String? designId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<StudioEditorBloc>()..add(StudioStarted(productSlug: productSlug, designId: designId))),
        BlocProvider(create: (_) => sl<PricingCubit>()),
        BlocProvider(create: (_) => sl<AutosaveCubit>(param1: designId)),
        BlocProvider(create: (_) => sl<UploadsCubit>()),
        BlocProvider(create: (_) => sl<AddToBagCubit>()),
      ],
      child: const _StudioView(),
    );
  }
}

class _StudioView extends StatefulWidget {
  const _StudioView();

  @override
  State<_StudioView> createState() => _StudioViewState();
}

class _StudioViewState extends State<_StudioView> {
  final _engine = StudioEngineController();
  EngineModel? _model;
  String? _modelFor;

  @override
  void dispose() {
    _engine.dispose();
    super.dispose();
  }

  // ── engine ───────────────────────────────────────────────────────────────

  Future<void> _loadModel(StudioBase base) async {
    _modelFor = base.code;
    setState(() => _model = null);
    final template = base.template;
    String? glb;
    if (template != null) {
      try {
        glb = await sl<TemplateModelLoader>().base64Of(template.modelUrl);
      } on Object {
        glb = null; // falls back to the procedural garment
      }
    }
    if (!mounted || _modelFor != base.code) return;
    setState(() => _model = EngineModel(productType: base.productType, model: base.model, areas: base.areas, template: glb == null ? null : template, glbBase64: glb));
  }

  void _onEngineEvent(EngineEvent e) {
    final editor = context.read<StudioEditorBloc>();
    switch (e) {
      case EngineLayerSelected(:final id):
        editor.add(LayerSelected(id));
      case EngineGestureStart():
        editor.add(const GestureStarted());
      case EngineGestureEnd():
        editor.add(const GestureEnded());
      case EngineLayerMoved(:final id, :final xCm, :final yCm):
        editor.add(LayerDragged(id, xCm, yCm));
      case EngineSurfaceMoved(:final id, :final anchor):
        editor.add(SurfaceDragged(id, anchor));
      case EnginePlaceAt(:final placement, :final xCm, :final yCm):
        editor.add(ZoneTapped(placement, xCm, yCm));
      case EngineFacing(:final placement):
        if (editor.state.step == StudioStep.editor) editor.add(PlacementSelected(placement));
      default:
        break;
    }
  }

  // ── editor → helpers ─────────────────────────────────────────────────────

  void _onEditorChanged(BuildContext context, StudioEditorState state) {
    final base = state.base;
    if (base != null && base.code != _modelFor) unawaited(_loadModel(base));
    final doc = state.doc;
    final config = state.config;
    if (doc == null || config == null || state.base == null) return;
    context.read<PricingCubit>().request(spec: doc.spec, layers: doc.layers, fonts: config.fonts, pricingVersionId: config.pricingVersionId);
    if (!state.readOnly) {
      context.read<AutosaveCubit>().changed(doc, fonts: config.fonts, imageRights: state.imageRightsConfirmed, meaningful: doc.layers.isNotEmpty);
    }
  }

  void _onNotice(BuildContext context, StudioEditorState state) {
    final l = context.l10n;
    switch (state.notice) {
      case StudioNotice.layersDropped:
        HooToast.show(context, l.studioLayersDropped(state.noticeValue), kind: HooAlertKind.warning);
      case StudioNotice.maxLayers:
        HooToast.show(context, l.studioMaxLayers(state.noticeValue), kind: HooAlertKind.warning);
      case StudioNotice.designNotEditable:
        HooToast.show(context, l.studioNotEditable);
      case StudioNotice.baseChanged:
      case null:
        break;
    }
  }

  Future<void> _addToBag(BuildContext context) async {
    final l = context.l10n;
    final state = context.read<StudioEditorBloc>().state;
    final autosave = context.read<AutosaveCubit>();
    final bag = sl<BagService>();
    final spec = state.spec;
    if (spec == null) return;
    final hasImages = state.layers.any((x) => x.isImage);
    if (state.layers.isEmpty) {
      HooToast.show(context, l.studioNeedsLayer, kind: HooAlertKind.warning);
      return;
    }
    if (hasImages && !state.imageRightsConfirmed) {
      HooToast.show(context, l.studioNeedsRights, kind: HooAlertKind.warning);
      return;
    }
    final doc = state.doc!;
    autosave.changed(doc, fonts: state.config!.fonts, imageRights: state.imageRightsConfirmed);
    final ok = await context.read<AddToBagCubit>().run(
      saveNow: autosave.flush,
      snapshot: () => _engine.snapshot(),
      confirmImageRights: state.imageRightsConfirmed,
      quantity: spec.quantity,
    );
    if (!context.mounted) return;
    if (ok) {
      unawaited(HooHaptics.light());
      await bag.showAddedSheet(context);
    }
  }

  Future<void> _saveDesign(BuildContext context) async {
    final state = context.read<StudioEditorBloc>().state;
    final autosave = context.read<AutosaveCubit>();
    final l = context.l10n;
    if (state.doc != null && state.config != null) autosave.changed(state.doc!, fonts: state.config!.fonts, imageRights: state.imageRightsConfirmed);
    final id = await autosave.flush();
    if (!context.mounted) return;
    if (id != null) {
      HooToast.success(context, l.studioSaved);
    } else {
      HooToast.show(context, l.studioSaveFailed, kind: HooAlertKind.warning);
    }
  }

  // ── build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<StudioEditorBloc, StudioEditorState>(
          listenWhen: (a, b) => a.base?.code != b.base?.code || a.spec != b.spec || a.layers != b.layers || a.doc?.name != b.doc?.name || a.imageRightsConfirmed != b.imageRightsConfirmed || (a.status != b.status && b.status == EditorStatus.ready),
          listener: _onEditorChanged,
        ),
        BlocListener<StudioEditorBloc, StudioEditorState>(listenWhen: (a, b) => a.noticeCount != b.noticeCount && b.notice != null, listener: _onNotice),
        BlocListener<StudioEditorBloc, StudioEditorState>(
          listenWhen: (a, b) => a.uploads != b.uploads || a.config?.maxUploadMegabytes != b.config?.maxUploadMegabytes,
          listener: (context, state) {
            final uploads = context.read<UploadsCubit>();
            if (state.config != null) uploads.maxMegabytes = state.config!.maxUploadMegabytes;
            unawaited(uploads.seed(state.uploads));
          },
        ),
        BlocListener<AutosaveCubit, AutosaveState>(
          listenWhen: (a, b) => a.designId != b.designId && b.designId != null,
          listener: (context, state) => context.read<StudioEditorBloc>().add(DesignPersisted(state.designId!)),
        ),
        BlocListener<UploadsCubit, UploadsState>(
          listenWhen: (a, b) => b.uploaded != null && a.uploaded != b.uploaded,
          listener: (context, state) {
            context.read<StudioEditorBloc>().add(ImageLayerAdded(state.uploaded!));
            context.read<UploadsCubit>().consumed();
          },
        ),
      ],
      child: BlocBuilder<StudioEditorBloc, StudioEditorState>(
        builder: (context, state) {
          final l = context.l10n;
          final editor = context.read<StudioEditorBloc>();
          return PopScope(
            canPop: state.step == StudioStep.product || state.status != EditorStatus.ready || (state.readOnly && state.step == StudioStep.editor),
            onPopInvokedWithResult: (didPop, _) {
              if (!didPop) editor.add(const StepBack());
            },
            child: Scaffold(
              backgroundColor: context.hoo.colors.background,
              appBar: HooAppBar(
                title: l.studioTitle,
                leading: HooIconButton(icon: state.step == StudioStep.product ? HooIcons.close : HooIcons.back, semanticLabel: l.a11yBack, onPressed: () => state.step == StudioStep.product || state.status != EditorStatus.ready ? context.router.maybePop() : editor.add(const StepBack())),
                actions: [
                  if (state.status == EditorStatus.ready && state.hasBase) ...[
                    const _SaveIndicator(),
                    if (state.step == StudioStep.editor && !state.readOnly) ...[
                      HooIconButton(icon: HooIcons.undo, semanticLabel: l.studioUndo, onPressed: state.canUndo ? () => editor.add(const UndoRequested()) : null),
                      HooIconButton(icon: HooIcons.redo, semanticLabel: l.studioRedo, onPressed: state.canRedo ? () => editor.add(const RedoRequested()) : null),
                    ],
                  ],
                ],
              ),
              body: switch (state.status) {
                EditorStatus.loading => const Center(child: HooLoading()),
                EditorStatus.failure => HooErrorState(error: state.error!, onRetry: () => editor.add(const StudioStarted())),
                EditorStatus.ready => _Body(state: state, engine: _engine, model: _model, onEvent: _onEngineEvent, onSave: () => _saveDesign(context)),
              },
              bottomNavigationBar: state.status == EditorStatus.ready && state.hasBase ? _PriceBar(state: state, onAddToBag: () => _addToBag(context)) : null,
            ),
          );
        },
      ),
    );
  }
}

class _SaveIndicator extends StatelessWidget {
  const _SaveIndicator();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return BlocBuilder<AutosaveCubit, AutosaveState>(
      builder: (context, s) {
        final label = switch (s.status) {
          SaveStatus.idle => null,
          SaveStatus.saving => l.commonSaving,
          SaveStatus.saved => l.commonSaved,
          SaveStatus.offline => l.studioSavedOffline,
          SaveStatus.failed => l.studioSaveFailed,
        };
        if (label == null) return const SizedBox.shrink();
        return Center(child: Padding(padding: const EdgeInsets.only(right: HooSpacing.xs), child: Text(label, style: context.hoo.text.caption.copyWith(color: s.status == SaveStatus.failed ? context.hoo.colors.error : context.hoo.colors.textSecondary))));
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state, required this.engine, required this.model, required this.onEvent, required this.onSave});

  final StudioEditorState state;
  final StudioEngineController engine;
  final EngineModel? model;
  final ValueChanged<EngineEvent> onEvent;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final editor = context.read<StudioEditorBloc>();
    final config = state.config!;
    final stepIndex = StudioStep.values.indexOf(state.step);
    final isEditor = state.step == StudioStep.editor;
    final uploads = context.watch<UploadsCubit>().state;

    Widget? view;
    if (state.hasBase) {
      view = StudioEngineView(
        controller: engine,
        model: model,
        colorHex: state.color?.hex ?? '#FFFFFF',
        layers: state.layers,
        images: uploads.images,
        selectedId: state.selectedLayerId,
        activePlacement: state.activePlacement,
        editable: isEditor && !state.readOnly,
        onEvent: onEvent,
      );
    }

    final panel = SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(HooSpacing.screen, HooSpacing.md, HooSpacing.screen, HooSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.stale) const OfflineBanner(),
          HooStepper(current: stepIndex + 1, total: StudioStep.values.length, title: _title(l, state.step)),
          const SizedBox(height: HooSpacing.md),
          AnimatedSwitcher(duration: context.hoo.motion(HooDurations.normal), child: KeyedSubtree(key: ValueKey(state.step), child: _content(context, config, editor))),
          if (state.step == StudioStep.review && !state.readOnly) ...[const SizedBox(height: HooSpacing.md), SecondaryButton(label: l.studioSaveDesign, onPressed: onSave)],
        ],
      ),
    );

    return LayoutBuilder(
      builder: (context, c) {
        if (view == null) return panel;
        if (c.maxWidth >= 900) {
          return Row(children: [Expanded(flex: 3, child: view), SizedBox(width: 420, child: panel)]);
        }
        final h = c.maxHeight * (isEditor ? 0.42 : 0.32);
        return Column(children: [SizedBox(height: h, width: double.infinity, child: view), Expanded(child: panel)]);
      },
    );
  }

  String _title(AppLocalizations l, StudioStep s) => switch (s) {
    StudioStep.product => l.studioStepProduct,
    StudioStep.fabric => l.studioStepFabric,
    StudioStep.size => l.studioStepSize,
    StudioStep.color => l.studioStepColor,
    StudioStep.editor => l.studioStepEditor,
    StudioStep.review => l.studioStepReview,
  };

  Widget _content(BuildContext context, StudioConfig config, StudioEditorBloc editor) {
    final base = state.base;
    final spec = state.spec;
    switch (state.step) {
      case StudioStep.product:
        return ProductStep(config: config, selected: base?.code, onSelect: (code) => editor.add(BaseSelected(code)));
      case StudioStep.fabric:
        if (base == null || spec == null) return const SizedBox.shrink();
        return FabricStep(config: config, base: base, spec: spec, onFabric: (c) => editor.add(FabricSelected(c)), onFeature: (c) => editor.add(FeatureToggled(c)));
      case StudioStep.size:
        if (base == null || spec == null) return const SizedBox.shrink();
        return SizeFitStep(config: config, base: base, spec: spec, onFit: (f) => editor.add(FitSelected(f)), onSize: (s) => editor.add(SizeSelected(s)), onMeasurements: (m) => editor.add(CustomMeasurementsChanged(m)));
      case StudioStep.color:
        if (base == null || spec == null) return const SizedBox.shrink();
        return ColorStep(base: base, spec: spec, onColor: (c) => editor.add(ColorSelected(c)));
      case StudioStep.editor:
        return const EditorPanel();
      case StudioStep.review:
        return const ReviewPanel();
    }
  }
}

/// Server-priced bottom bar: total, breakdown, estimated lead time and the step's call to action.
class _PriceBar extends StatelessWidget {
  const _PriceBar({required this.state, required this.onAddToBag});

  final StudioEditorState state;
  final VoidCallback onAddToBag;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final editor = context.read<StudioEditorBloc>();
    final pricing = context.watch<PricingCubit>().state;
    final bag = context.watch<AddToBagCubit>().state;
    final quote = pricing.quote;
    final isReview = state.step == StudioStep.review;
    final canContinue = state.canLeave(state.step);
    final breakdown = <PriceLine>[
      if (quote != null) ...[
        for (final b in quote.breakdown) PriceLine(label: b.label, detail: b.detail, amount: b.unitAmount),
        if (quote.volumeDiscount > 0) PriceLine(label: l.studioVolumeDiscount(quote.volumeDiscountPercent.toStringAsFixed(0)), amount: -quote.volumeDiscount, signed: true),
        if (quote.rushFee > 0) PriceLine(label: l.studioRush, amount: quote.rushFee, signed: true),
        if (quote.setupFee > 0) PriceLine(label: l.studioSetupFee, amount: quote.setupFee, signed: true),
      ],
    ];
    final caption = quote == null
        ? null
        : [
            if (quote.quantity > 1) l.studioPriceCaption(quote.quantity, HooFormat.money(context, quote.unitPrice)),
            if (quote.leadTimeMaxDays > 0) leadTimeLabel(context, quote.leadTimeMinDays, quote.leadTimeMaxDays),
          ].where((s) => s.isNotEmpty).join(' · ');
    if (state.readOnly) return const SizedBox.shrink();
    return PriceSummaryBar(
      total: quote?.total,
      updating: pricing.loading,
      breakdown: breakdown,
      caption: caption == null || caption.isEmpty ? null : caption,
      ctaLabel: isReview ? l.studioAddToBag : l.commonContinue,
      accentCta: isReview,
      ctaLoading: bag.busy,
      onCta: isReview ? (bag.busy ? null : onAddToBag) : (canContinue ? () => editor.add(const StepAdvanced()) : null),
    );
  }
}
