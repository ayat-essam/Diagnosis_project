import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/error/exceptions.dart';
import 'package:diagnosis_project/Feature/Treatment/data/datasources/prescription_remote_datasource.dart';
import 'package:diagnosis_project/Feature/Treatment/data/models/add_prescription_model.dart';

class PrescriptionRemoteDataSourceImpl implements PrescriptionRemoteDataSource {
  final ApiConsumer api;
  PrescriptionRemoteDataSourceImpl(this.api);

  @override
  Future<AddPrescriptionModel> getPrescription(
      AddPrescriptionModel model, int patientId) async {
    final response = await api.get(
      "/Treatment/patient/${patientId}",
    );
    if (response["success"] == false) {
      throw ServerException(errorModel: response["message"]);
    }
    return AddPrescriptionModel.fromJson(response);
  }
}
