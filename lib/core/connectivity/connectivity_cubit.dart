import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// `true` while the device has a network interface. Screens show the offline banner and switch to cached,
/// read-only data; the Studio autosave queue flushes when this flips back to online.
class ConnectivityCubit extends Cubit<bool> {
  ConnectivityCubit(this._connectivity) : super(true) {
    _sub = _connectivity.onConnectivityChanged.listen(_update);
    _connectivity.checkConnectivity().then(_update).catchError((_) {});
  }

  final Connectivity _connectivity;
  late final StreamSubscription<List<ConnectivityResult>> _sub;

  bool get isOnline => state;

  void _update(List<ConnectivityResult> r) => emit(r.any((x) => x != ConnectivityResult.none));

  @override
  Future<void> close() async {
    await _sub.cancel();
    return super.close();
  }
}
