import '../../../../../Core/api/api_consumer.dart';
import '../models/doctor_model.dart';

abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getDoctorList();
}

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
  final ApiConsumer apiConsumer;

  DoctorRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<DoctorModel>> getDoctorList() async {
    final response = await apiConsumer.get(
      '/PatientDashboard/Get-DoctorList',
    );

    return (response as List)
        .map((e) => DoctorModel.fromJson(e))
        .toList();
  }
}
