part of 'doctor_consultations_cubit.dart';

@immutable
sealed class DoctorConsultationsState {}

final class DoctorConsultationsInitial extends DoctorConsultationsState {}

final class DoctorConsultationsLoading extends DoctorConsultationsState {}

final class DoctorConsultationsFailure extends DoctorConsultationsState {
  final String errorMessage;

  DoctorConsultationsFailure({required this.errorMessage});
}

final class DoctorConsultationsSuccess extends DoctorConsultationsState {
  final List<DoctorConsultationsEntity> doctorConsultationsList;

  DoctorConsultationsSuccess({required this.doctorConsultationsList});
}
