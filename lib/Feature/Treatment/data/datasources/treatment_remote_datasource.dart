import 'package:diagnosis_project/Feature/Treatment/data/models/treatment_model.dart';

abstract class TreatmentRemoteDataSource {

  Future<TreatmentPlanModel> getTreatmentPlan(int patientId);
}