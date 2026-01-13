part of 'doctor_dashboard_cubit.dart';

abstract class DoctorDashboardState {}

class DoctorDashboardInitial extends DoctorDashboardState {}

class DoctorDashboardLoading extends DoctorDashboardState {}

class DoctorDashboardSuccess extends DoctorDashboardState {
  final DoctorDashboardEntity data;
  DoctorDashboardSuccess(this.data);
}

class DoctorDashboardError extends DoctorDashboardState {
  final String message;
  DoctorDashboardError(this.message);
}
