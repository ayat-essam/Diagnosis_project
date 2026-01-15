import 'package:diagnosis_project/Feature/Treatment/data/models/add_prescription_model.dart';

abstract class PrescriptionRemoteDataSource {
  Future<void> getPrescription(AddPrescriptionModel model, int patientId);
}
