part of 'treatment_plan_cubit.dart';

@immutable
abstract class TreatmentState {}

class TreatmentInitial extends TreatmentState {}

class TreatmentLoading extends TreatmentState {}

class TreatmentLoaded extends TreatmentState {
  final TreatmentPlanEntity plan;
  TreatmentLoaded(this.plan);
}

class TreatmentError extends TreatmentState {
  final String message;
  TreatmentError(this.message);
}
