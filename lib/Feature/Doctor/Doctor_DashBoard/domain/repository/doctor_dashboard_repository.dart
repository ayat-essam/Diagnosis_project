import '../entities/doctor_dashboard_entity.dart';

abstract class DoctorDashboardRepository {
  Future<DoctorDashboardEntity> getDoctorDashboard();
}
