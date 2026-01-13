import 'dart:async';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/usecases/delete_patient_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/usecases/get_patient_profile_use_case.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/usecases/get_patients_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'patients_management_state.dart';

class PatientsMangementCubit extends Cubit<PatientsManagementState> {
  final GetPatientProfileUseCase getPatientProfileUseCase;
  final GetPatientsUsecase getPatientsUsecase;
  final DeletePatientUsecase deletePatientUsecase;

  PatientsMangementCubit(
      {required this.getPatientProfileUseCase,
      required this.getPatientsUsecase,
      required this.deletePatientUsecase})
      : super(PatientsManagementInitial());

  Timer? _debounce;

  void getpatients({String? search, String? status}) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(GetPatientsLoading());

      final result = await getPatientsUsecase(
        search: search ?? '',
        status: status ?? "All",
      );

      result.fold(
        (l) => emit(GetPatientsError(l.errorMessage)),
        (r) => emit(GetPatientsSuccess(r)),
      );
    });
  }

  void getPatientProfile(int id) async {
    emit(GetPatientsProfileLoading());

    final result = await getPatientProfileUseCase(id: id);

    result.fold(
      (l) => emit(GetPatientProfileError(l.errorMessage)),
      (r) => emit(GetPatientProfileSuccess(r)),
    );
  }

  void deletePatient(int id) async {
    emit(DeletePatientsLoading());

    final result = await deletePatientUsecase(id: id);

    result.fold(
      (l) => emit(DeletePatientError(l.errorMessage)),
      (r) => emit(DeletePatientSuccess()),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
