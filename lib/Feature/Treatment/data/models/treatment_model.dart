import 'package:diagnosis_project/Feature/Treatment/data/models/add_prescription_model.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/treatment_plan.dart';

class TreatmentPlanModel extends TreatmentPlanEntity {
  TreatmentPlanModel({
    required super.doctorName,
    required super.duration,
    required super.overview,
    required super.medications,
    required super.hydration,
    required super.restrictions,
  });

  factory TreatmentPlanModel.fromJson(Map<String, dynamic> json) {
    return TreatmentPlanModel(
      doctorName: json['doctor_name'] ?? '',
      duration: json['duration'] ?? '',
      overview: json['overview'] ?? '',
      medications: (json['medications'] as List)
          .map((m) => AddPrescriptionModel.fromJson(m))
          .toList(),
      hydration: json['hydration'] ?? '',
      restrictions: json['restrictions'] ?? '',
    );
  }
  TreatmentPlanEntity toEntity() {
    return TreatmentPlanEntity(
      doctorName: doctorName,
      duration: duration,
      overview: overview,
      medications: medications,
      hydration: hydration,
      restrictions: restrictions,
    );
  }
}
