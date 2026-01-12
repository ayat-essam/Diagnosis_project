import 'package:injectable/injectable.dart';

import '../../../../../Core/api/api_consumer.dart';
import '../models/doctor_dashboard_model.dart';

abstract class DoctorDashboardRemoteDataSource {
  Future<DoctorDashboardModel> getDoctorDashboard();
}

@LazySingleton(as: DoctorDashboardRemoteDataSource)
class DoctorDashboardRemoteDataSourceImpl
    implements DoctorDashboardRemoteDataSource {
  final ApiConsumer apiConsumer;

  DoctorDashboardRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<DoctorDashboardModel> getDoctorDashboard() async {
    final response = await apiConsumer.get('/doctor/dashboard');
    return DoctorDashboardModel.fromJson(response);
  }
}
