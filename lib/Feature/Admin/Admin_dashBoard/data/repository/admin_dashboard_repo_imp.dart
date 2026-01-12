import 'package:injectable/injectable.dart';
import '../../domain/entities/admin_dashboard_entity.dart';
import '../../domain/repository/admin_dashboard_repo.dart';
import '../data source/admin_dashboard_remote_datasource.dart';

@LazySingleton(as: AdminDashboardRepository)
class AdminDashboardRepositoryImpl implements AdminDashboardRepository {
  final AdminDashboardRemoteDataSource remoteDataSource;

  AdminDashboardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AdminDashboardEntity> getAdminDashboard() async {
    return await remoteDataSource.getAdminDashboard();
  }
}
