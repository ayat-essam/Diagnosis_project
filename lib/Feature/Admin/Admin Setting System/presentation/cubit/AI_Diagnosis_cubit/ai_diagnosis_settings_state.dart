part of 'ai_diagnosis_settings_cubit.dart';

@immutable
sealed class AiDiagnosisSettingsState {}

final class AiDiagnosisSettingsInitial extends AiDiagnosisSettingsState {}

final class AiDiagnosisSettingsLoading extends AiDiagnosisSettingsState {}

final class AiDiagnosisSettingsFailure extends AiDiagnosisSettingsState {
  final ErrorModel errorModel;

  AiDiagnosisSettingsFailure({required this.errorModel});
}

final class AiDiagnosisSettingsSuccess extends AiDiagnosisSettingsState {}

final class IstoggleAiLoading extends AiDiagnosisSettingsState {}

final class IstoggleAiFailure extends AiDiagnosisSettingsState {
  final ErrorModel errorModel;

  IstoggleAiFailure({required this.errorModel});
}

final class IstoggleAiSuccess extends AiDiagnosisSettingsState {}
