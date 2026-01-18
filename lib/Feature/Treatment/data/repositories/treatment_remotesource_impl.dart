import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/error/exceptions.dart';
import 'package:diagnosis_project/Feature/Treatment/data/datasources/treatment_remote_datasource.dart';
import 'package:diagnosis_project/Feature/Treatment/data/models/treatment_model.dart';

class TreatmentRemoteDataSourceImpl implements TreatmentRemoteDataSource {
  final ApiConsumer api;

  TreatmentRemoteDataSourceImpl(this.api);

  @override
  Future<TreatmentPlanModel> getTreatmentPlan(int patientId) async {
    final response = await api.post(
      "/Treatment/treatment-plan",
      data: {
        "patientId": patientId,
      },
    );
    if (response["success"] == false) {
      throw ServerException(errorModel: response["message"]);
    }
    return TreatmentPlanModel.fromJson(response);
  }
}
