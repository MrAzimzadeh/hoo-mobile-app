import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../domain/checkout_models.dart';
import '../../domain/checkout_repository.dart';

class GiftMessageState extends Equatable {
  const GiftMessageState({this.check, this.checking = false});

  final GiftMessageCheck? check;
  final bool checking;

  @override
  List<Object?> get props => [check, checking];
}

/// Live moderation of the greeting-card message (`POST /gift/message/validate`): debounced, the previous request is
/// cancelled when the text changes again.
class GiftMessageCubit extends Cubit<GiftMessageState> {
  GiftMessageCubit(this._repo, {Duration debounce = HooDurations.searchDebounce}) : _debounce = debounce, super(const GiftMessageState());

  final CheckoutRepository _repo;
  final Duration _debounce;
  Timer? _timer;
  CancelToken? _token;

  void changed({required String message, required String fromName}) {
    _timer?.cancel();
    _token?.cancel();
    if (message.trim().isEmpty && fromName.trim().isEmpty) {
      emit(const GiftMessageState());
      return;
    }
    emit(GiftMessageState(check: state.check, checking: true));
    _timer = Timer(_debounce, () async {
      final token = _token = CancelToken();
      try {
        final check = await _repo.validateGiftMessage(message: message, fromName: fromName, cancelToken: token);
        if (!isClosed && !token.isCancelled) emit(GiftMessageState(check: check));
      } on ApiException catch (e) {
        if (!isClosed && !e.isCancelled) emit(GiftMessageState(check: state.check));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _token?.cancel();
    return super.close();
  }
}
