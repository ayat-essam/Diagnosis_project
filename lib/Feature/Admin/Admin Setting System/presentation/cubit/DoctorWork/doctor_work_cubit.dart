import 'package:bloc/bloc.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/set_doctor_limit_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/set_doctor_work_hour_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'doctor_work_state.dart';

class DoctorWorkCubit extends Cubit<DoctorWorkState> {
  DoctorWorkCubit(this.setDoctorRateLimitUseCase, this.setDoctorWorkHourUseCase)
      : super(DoctorWorkInitial());
  final SetDoctorRateLimitUseCase setDoctorRateLimitUseCase;
  final SetDoctorWorkHourUseCase setDoctorWorkHourUseCase;
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  Future<void> setDoctorRateLimit() async {
    final value = int.tryParse(controller1.text.trim());

    if (value == null) {
      emit(
        SetDoctorRateLimitFailure(
          errorModel: ErrorModel(errorMessage: 'Please enter a valid number'),
        ),
      );
      return;
    }

    emit(SetDoctorRateLimitLoading());

    var result = await setDoctorRateLimitUseCase(
      maxRequestsPerDay: value,
    );

    result.fold(
      (l) => emit(SetDoctorRateLimitFailure(errorModel: l)),
      (r) => emit(SetDoctorRateLimitSuccess()),
    );
  }
}
