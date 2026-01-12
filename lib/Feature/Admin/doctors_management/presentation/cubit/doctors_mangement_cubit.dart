import 'dart:async';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/usecases/get_doctor_profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/usecases/get_doctors_usecase.dart';
import 'doctors_management_state.dart';

class DoctorsManagementCubit extends Cubit<DoctorsManagementState> {
  final GetDoctorsUseCase getDoctorsUseCase;
  final GetDoctorProfileUseCase getDoctorProfileUseCase;

  DoctorsManagementCubit(
      {required this.getDoctorsUseCase, required this.getDoctorProfileUseCase})
      : super(DoctorsManagementInitial());

  Timer? _debounce;

  void getDoctors({String? search, bool? isActive}) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(GetDoctorsLoading());

      final result = await getDoctorsUseCase(
        search: search ?? '',
        isActive: isActive ?? true,
      );

      result.fold(
        (l) => emit(GetDoctorsError(l.errorMessage)),
        (r) => emit(GetDoctorsSuccess(r)),
      );
    });
  }

  void getDoctorProfile(int id) async {
    emit(GetDoctorProfileLoading());

    final result = await getDoctorProfileUseCase(id: id);

    result.fold(
      (l) => emit(GetDoctorProfileError(l.errorMessage)),
      (r) => emit(GetDoctorProfileSuccess(r)),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
