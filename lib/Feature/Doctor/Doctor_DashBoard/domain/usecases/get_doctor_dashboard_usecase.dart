import '../entities/doctor_dashboard_entity.dart';
import '../repository/doctor_dashboard_repository.dart';


class GetDoctorDashboardUseCase {
  final DoctorDashboardRepository repository;

  GetDoctorDashboardUseCase(this.repository);

  Future<DoctorDashboardEntity> call() {
    return repository.getDoctorDashboard();
  }
}
