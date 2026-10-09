import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injector.dart';
import '../../../../core/analytics/analytics.dart';
import '../../../../core/connectivity/connectivity_cubit.dart';
import '../../../../core/storage/app_database.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../data/studio_repository.dart';
import '../../domain/models/design.dart';
import '../../engine/engine_protocol.dart';
import '../../engine/studio_engine_view.dart';
import '../bloc/studio_editor_bloc.dart';
import '../bloc/studio_side_cubits.dart';
import '../widgets/studio_panels.dart';
import '../widgets/studio_price_bar.dart';

/// Studio — "Design your own". One persistent 3D stage across all steps; Flutter state (the editor bloc) is the
/// source of truth and is mirrored into the engine; pricing and autosave observe the design.
@RoutePage()
class StudioPage extends StatelessWidget {
  const StudioPage({super.key, @QueryParam('product') this.productSlug, @QueryParam('design') this.designId});

  /// Opened from a PDP via "Customize this" → base `p-<productId>` resolved from the slug.
  final String? productSlug;

  /// Resume/edit an existing design.
  final String? designId;

  @override
  Widget build(BuildContext context) {
    final repo = sl<StudioRepository>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<StudioEditorBloc>()..add(StudioOpened(productSlug: productSlug, designId: designId))),
        BlocProvider(create: (ctx) => PricingCubit(repo, onPricingOutdated: () => ctx.read<StudioEditorBloc>().add(StudioOpened(productSlug: productSlug, designId: designId)))),
        BlocProvider(create: (_) => AutosaveCubit(repo, sl<AppDatabase>(), sl<ConnectivityCubit>(), designId: designId)),
        BlocProvider(create: (_) => UploadCubit(repo)),
      ],
      child: RepositoryProvider(create: (_) => EngineRef(), child: const _StudioView()),
    );
  }
}

class _StudioView extends StatefulWidget {
  const _StudioView();

  @override
  State<_StudioView> createState() => _StudioViewState();
}

class _StudioViewState extends State<_StudioView> {
  StudioEngineController? _engine;
  StreamSubscription<EngineEvent>? _engineSub;
  String? _loadedBase;
  String? _loadedColor;

  @override
  void initState() {
    super.initState();
    sl<Analytics>().studioOpened();
  }

  @override
  void dispose() {
    _engineSub?.cancel();
    super.dispose();
  }

  void _onEngine(StudioEngineController c) {
    _engine = c;
    context.read<EngineRef>().controller = c;
    c.init(background: '#00000000', reducedMotion: MediaQuery.maybeDisableAnimationsOf(context) ?? false);
    final bloc = context.read<StudioEditorBloc>();
    _engineSub = c.events.listen((e) {
      switch (e) {
        case EngineSelectLayer(:final id):
          bloc.add(LayerSelected(id));
        case EngineGestureStart(:final id):
          bloc.add(LayerGestureStarted(id));
        case EngineMoveLayer(:final id, :final xCm, :final yCm):
          bloc.add(LayerDragged(id, xCm, yCm));
        case EngineMoveSurface(:final id, :final anchor):
          bloc.add(FreeLayerDragged(id, anchor));
        case EngineGestureEnd(:final id):
          bloc.add(LayerGestureEnded(id));
        case EnginePlaceAt(:final placement, :final xCm, :final yCm):
          bloc.add(SpotPicked(placement, xCm, yCm));
        case EnginePlaceSurface(:final at):
          bloc.add(SurfacePicked(at));
        case EngineFacing(:final placement):
          if (bloc.state.step == StudioStep.editor) bloc.add(PlacementActivated(placement, fromCamera: true));
        case EngineModelFailed():
          if (mounted) HooToast.show(context, context.l10n.studioModelFallback);
        default:
          break;
      }
    });
    _sync(bloc.state, force: true);
  }

  /// Mirrors the editor state into the renderer (model, tint, layers, active zone).
  Future<void> _sync(StudioState s, {bool force = false, StudioState? previous}) async {
    final c = _engine;
    final base = s.base;
    final spec = s.spec;
    if (c == null || base == null || spec == null) return;
    final colorHex = base.color(spec.colorId)?.hex ?? '#121212';
    if (force || _loadedBase != base.code) {
      _loadedBase = base.code;
      _loadedColor = colorHex;
      String? glb;
      final tpl = base.template;
      if (tpl != null) {
        try {
          glb = base64Encode(await sl<StudioRepository>().modelBytes(tpl.modelUrl));
        } catch (_) {
          glb = null; // falls back to the procedural garment
        }
      }
      await c.loadModel(base: base, colorHex: colorHex, glbBase64: glb);
    } else if (_loadedColor != colorHex) {
      _loadedColor = colorHex;
      await c.setColor(colorHex);
    }
    final images = {
      for (final u in s.uploads.values) u.id: s.localImages[u.id] ?? sl<StudioRepository>().absolute(u.url),
    };
    if (force || previous == null || previous.layers != s.layers || previous.hidden != s.hidden || previous.selectedId != s.selectedId || previous.uploads != s.uploads) {
      await c.setLayers(s.layers, hidden: s.hidden, images: images, selectedId: s.selectedId);
    }
    final active = s.activePlacement;
    if (active != null && (force || previous?.activePlacement != active || previous?.step != s.step)) {
      await c.setActive(active, focus: s.step == StudioStep.editor, showGuides: s.step == StudioStep.editor);
    }
    if (force || previous?.editable != s.editable || previous?.step != s.step) {
      await c.setEditable(s.editable && s.step == StudioStep.editor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return MultiBlocListener(
      listeners: [
        BlocListener<StudioEditorBloc, StudioState>(
          listener: (context, s) {
            final prev = _previous;
            _previous = s;
            unawaited(_sync(s, previous: prev));
            final doc = s.doc;
            final config = s.config;
            if (doc != null && config != null) {
              context.read<PricingCubit>().update(doc, config);
              context.read<AutosaveCubit>().changed(doc, config, meaningful: doc.layers.isNotEmpty || s.step == StudioStep.review, editable: s.editable);
            }
            if (s.notice == 'studio.too_many_layers') HooToast.show(context, l.studioTooManyLayers(s.maxLayers));
            if (prev != null && prev.step != s.step) HooHaptics.light();
          },
        ),
        BlocListener<AutosaveCubit, AutosaveState>(
          listenWhen: (a, b) => a.designId != b.designId && b.designId != null,
          listener: (context, s) => context.read<StudioEditorBloc>().add(DesignIdAssigned(s.designId!)),
        ),
        BlocListener<UploadCubit, UploadState>(
          listener: (context, s) {
            final r = s.result;
            if (r != null) {
              context.read<StudioEditorBloc>().add(ImageLayerAdded(r.upload, r.dataUrl));
              context.read<UploadCubit>().consumed();
            }
            if (s.error != null) HooToast.error(context, s.error!);
            if (s.tooLarge) HooToast.show(context, l.studioUploadTooLarge(context.read<StudioEditorBloc>().state.config?.maxUploadMegabytes ?? 20), kind: HooAlertKind.error);
          },
        ),
      ],
      child: BlocBuilder<StudioEditorBloc, StudioState>(
        buildWhen: (a, b) => a.status != b.status || a.step != b.step || a.canUndo != b.canUndo || a.canRedo != b.canRedo || a.editable != b.editable,
        builder: (context, s) {
          if (s.status == StudioStatus.failure) {
            return Scaffold(appBar: const HooAppBar(), body: HooErrorState(error: s.error!, onRetry: () => context.read<StudioEditorBloc>().add(const StudioOpened())));
          }
          final tablet = context.hoo.isTablet;
          final stage = StudioEngineView(onCreated: _onEngine);
          final panel = s.status == StudioStatus.loading ? const HooLoading() : const StudioStepPanel();
          return Scaffold(
            appBar: _StudioTopBar(state: s),
            body: tablet
                ? Row(children: [
                    Expanded(flex: 3, child: stage),
                    VerticalDivider(width: 1, color: context.hoo.colors.border),
                    SizedBox(width: 420, child: panel),
                  ])
                : Column(children: [
                    AnimatedContainer(
                      duration: context.hoo.motion(HooDurations.medium),
                      curve: HooCurves.emphasized,
                      height: MediaQuery.sizeOf(context).height * (s.step == StudioStep.editor ? 0.52 : s.step == StudioStep.review ? 0.3 : 0.36),
                      child: stage,
                    ),
                    Expanded(child: panel),
                  ]),
            bottomNavigationBar: s.status == StudioStatus.ready ? const StudioPriceBar() : null,
          );
        },
      ),
    );
  }

  StudioState? _previous;
}

class _StudioTopBar extends StatelessWidget implements PreferredSizeWidget {
  const _StudioTopBar({required this.state});
  final StudioState state;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bloc = context.read<StudioEditorBloc>();
    final stepIndex = StudioStep.values.indexOf(state.step);
    return HooAppBar(
      leading: HooIconButton(icon: HooIcons.close, semanticLabel: l.a11yClose, onPressed: () => context.router.maybePop()),
      titleWidget: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(studioStepTitle(l, state.step), style: context.hoo.text.h3),
        const _SaveIndicator(),
      ]),
      actions: [
        if (state.step == StudioStep.editor) ...[
          HooIconButton(icon: HooIcons.undo, semanticLabel: l.studioUndo, onPressed: state.canUndo ? () => bloc.add(const UndoRequested()) : null, color: state.canUndo ? null : context.hoo.colors.textTertiary),
          HooIconButton(icon: HooIcons.redo, semanticLabel: l.studioRedo, onPressed: state.canRedo ? () => bloc.add(const RedoRequested()) : null, color: state.canRedo ? null : context.hoo.colors.textTertiary),
        ],
      ],
      bottom: state.step == StudioStep.review || state.status != StudioStatus.ready
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(HooSpacing.screen, 0, HooSpacing.screen, HooSpacing.xs),
                child: _StepDots(current: stepIndex, total: 5, onTap: (i) => bloc.add(StudioStepChanged(StudioStep.values[i]))),
              ),
            ),
    );
  }
}

/// "Step N of 5" progress as tappable segments.
class _StepDots extends StatelessWidget {
  const _StepDots({required this.current, required this.total, required this.onTap});
  final int current;
  final int total;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Semantics(
      label: context.l10n.stepOf(current + 1, total),
      child: Row(children: [
        for (var i = 0; i < total; i++)
          Expanded(
            child: GestureDetector(
              onTap: i <= current ? () => onTap(i) : null,
              child: AnimatedContainer(
                duration: context.hoo.motion(HooDurations.medium),
                curve: HooCurves.emphasized,
                height: 3,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(color: i <= current ? c.accent : c.border, borderRadius: HooRadius.pillAll),
              ),
            ),
          ),
      ]),
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
        final text = switch (s.status) {
          SaveStatus.saving => l.commonSaving,
          SaveStatus.saved => l.commonSaved,
          SaveStatus.offline => l.studioSavedOffline,
          SaveStatus.error => l.studioSaveFailed,
          SaveStatus.idle => '',
        };
        return AnimatedSwitcher(
          duration: context.hoo.motion(HooDurations.normal),
          child: Text(text, key: ValueKey(text), style: context.hoo.text.caption.copyWith(fontSize: 11)),
        );
      },
    );
  }
}

/// Placement wire name → localized label.
String placementLabel(AppLocalizations l, String placement, {String? zoneName}) => switch (placement) {
      'Front' => l.studioFront,
      'Back' => l.studioBack,
      'LeftSleeve' => l.studioLeftSleeve,
      'RightSleeve' => l.studioRightSleeve,
      'Hood' => l.studioHood,
      _ when placement.startsWith('free-') => l.studioFreeSpot,
      _ => zoneName ?? placement,
    };

String studioStepTitle(AppLocalizations l, StudioStep s) => switch (s) {
      StudioStep.product => l.studioStepProduct,
      StudioStep.fabric => l.studioStepFabric,
      StudioStep.fit => l.studioStepFit,
      StudioStep.color => l.studioStepColor,
      StudioStep.editor => l.studioStepEditor,
      StudioStep.review => l.studioStepReview,
    };

/// Size label (custom measurements show as "Custom").
String sizeLabel(AppLocalizations l, DesignSpec spec) => spec.customMeasurements != null ? l.studioCustomSize : (spec.size?.label ?? '—');
