import 'package:bloc/bloc.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/prescription_entity.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/usecase/add_prescription_usecase.dart';
import 'package:meta/meta.dart';

part 'prescription_state.dart';

class AddPrescriptionCubit extends Cubit<AddPrescriptionState> {
  final AddPrescriptionUseCase useCase;

  AddPrescriptionCubit(this.useCase) : super(AddPrescriptionInitial());

  Future<void> submit(PrescriptionEntity entity, int patientId) async {
    emit(AddPrescriptionLoading());

    final result = await useCase(entity, patientId);

    result.fold(
      (failure) {
        if (failure.errMessge.contains('token') ||
            failure.errMessge.contains('401')) {
          emit(AddPrescriptionAuthExpired());
        } else {
          emit(AddPrescriptionError(failure.errMessge));
        }
      },
      (_) => emit(AddPrescriptionSuccess()),
    );
  }
}
