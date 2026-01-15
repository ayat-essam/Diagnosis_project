import 'package:bloc/bloc.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/treatment_plan.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/usecase/treatment_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'treatment_plan_state.dart';

class TreatmentCubit extends Cubit<TreatmentState> {
  final TreatmentUseCase getTreatmentUseCase;

  TreatmentCubit(this.getTreatmentUseCase) : super(TreatmentInitial());

  Future<void> fetchTreatmentPlan(int patientId) async {
    emit(TreatmentLoading());

    final result = await getTreatmentUseCase(patientId);

    result.fold(
      (error) => emit(TreatmentError(error.errMessge)),
      (plan) => emit(TreatmentLoaded(plan)),
    );
  }
}
