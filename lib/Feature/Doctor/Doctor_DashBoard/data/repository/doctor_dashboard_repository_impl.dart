import 'package:injectable/injectable.dart';
import '../../domain/entities/doctor_dashboard_entity.dart';
import '../../domain/repository/doctor_dashboard_repository.dart';
import '../data source/doctor_dashboard_remote_data_source.dart';

@LazySingleton(as: DoctorDashboardRepository)
class DoctorDashboardRepositoryImpl implements DoctorDashboardRepository {
  final DoctorDashboardRemoteDataSource remoteDataSource;

  DoctorDashboardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DoctorDashboardEntity> getDoctorDashboard() {
    return remoteDataSource.getDoctorDashboard();
  }
}
