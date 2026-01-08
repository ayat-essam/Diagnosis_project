part of 'doctor_work_cubit.dart';

@immutable
sealed class DoctorWorkState {}

final class DoctorWorkInitial extends DoctorWorkState {}

final class SetDoctorRateLimitLoading extends DoctorWorkState {}

final class SetDoctorRateLimitFailure extends DoctorWorkState {
  final ErrorModel errorModel;

  SetDoctorRateLimitFailure({required this.errorModel});
}

final class SetDoctorRateLimitSuccess extends DoctorWorkState {}

final class SetDoctorWorkHourLoading extends DoctorWorkState {}

final class SetDoctorWorkHourFailure extends DoctorWorkState {
  final ErrorModel errorModel;

  SetDoctorWorkHourFailure({required this.errorModel});
}

final class SetDoctorWorkHourSuccess extends DoctorWorkState {}
