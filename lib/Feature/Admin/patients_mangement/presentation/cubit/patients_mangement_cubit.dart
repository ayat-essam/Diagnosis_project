import 'dart:async';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/usecases/get_patient_profile_use_case.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/usecases/get_patients_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'patients_management_state.dart';

class PatientsMangementCubit extends Cubit<PatientsManagementState> {
  final GetPatientProfileUseCase getPatientProfileUseCase;
  final GetPatientsUsecase getPatientsUsecase;

  PatientsMangementCubit(
      {required this.getPatientProfileUseCase, required this.getPatientsUsecase})
      : super(PatientsManagementInitial());

  Timer? _debounce;

  void getpatients({String? search, bool? isActive}) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(GetPatientsLoading());

      final result = await getPatientsUsecase(
        search: search ?? '',
        isActive: isActive ?? true,
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

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
