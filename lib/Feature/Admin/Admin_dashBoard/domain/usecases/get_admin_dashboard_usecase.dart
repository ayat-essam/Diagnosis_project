import '../entities/admin_dashboard_entity.dart';
import '../repository/admin_dashboard_repo.dart';

class GetAdminDashboardUseCase {
  final AdminDashboardRepository repository;

  GetAdminDashboardUseCase(this.repository);

  Future<AdminDashboardEntity> call() async {
    return await repository.getAdminDashboard();
  }
}
