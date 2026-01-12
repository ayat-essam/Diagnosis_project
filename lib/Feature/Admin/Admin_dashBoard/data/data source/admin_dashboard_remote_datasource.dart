import 'package:injectable/injectable.dart';
import '../../../../../Core/api/api_consumer.dart';
import '../../domain/entities/admin_dashboard_entity.dart';
import '../models/admin_dashboard_model.dart';

abstract class AdminDashboardRemoteDataSource {
  Future<AdminDashboardEntity> getAdminDashboard();
}

@LazySingleton(as: AdminDashboardRemoteDataSource)
class AdminDashboardRemoteDataSourceImpl
    implements AdminDashboardRemoteDataSource {
  final ApiConsumer api;

  AdminDashboardRemoteDataSourceImpl(this.api);

  @override
  Future<AdminDashboardEntity> getAdminDashboard() async {
    final response = await api.get('/AdminDashboard');
    return AdminDashboardModel.fromJson(response);
  }
}
