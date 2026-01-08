import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/set_ai_rate_limit_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/toggle_ai_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'ai_diagnosis_settings_state.dart';

class AiDiagnosisSettingsCubit extends Cubit<AiDiagnosisSettingsState> {
  AiDiagnosisSettingsCubit(
      {required this.toggleAiUseCase, required this.setAiRateLimitUseCase})
      : super(AiDiagnosisSettingsInitial());
  final SetAiRateLimitUseCase setAiRateLimitUseCase;
  final ToggleAiUseCase toggleAiUseCase;
  final TextEditingController controller = TextEditingController();
  Future<void> setAiRateLimit() async {
    final value = int.tryParse(controller.text.trim());

    if (value == null) {
      emit(
        AiDiagnosisSettingsFailure(
          errorModel: ErrorModel(errorMessage: 'Please enter a valid number'),
        ),
      );
      return;
    }

    emit(AiDiagnosisSettingsLoading());

    var result = await setAiRateLimitUseCase(
      maxRequestsPerDay: value,
    );

    result.fold(
      (l) => emit(AiDiagnosisSettingsFailure(errorModel: l)),
      (r) => emit(AiDiagnosisSettingsSuccess()),
    );
  }

  bool isToggle = false;
  Future<void> settoggleAi() async {
    emit(IstoggleAiLoading());
    var result = await toggleAiUseCase.call(enabled: isToggle);
    result.fold((l) => emit(IstoggleAiFailure(errorModel: l)),
        (r) => emit(IstoggleAiSuccess()));
  }
}
