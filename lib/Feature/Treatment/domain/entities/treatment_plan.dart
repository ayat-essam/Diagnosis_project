import 'package:diagnosis_project/Feature/Treatment/domain/entities/prescription_entity.dart';

class TreatmentPlanEntity {
  final String doctorName;
  final String duration;
  final String overview;
  final List<PrescriptionEntity> medications;
  final String hydration;
  final String restrictions;

  TreatmentPlanEntity({
    required this.doctorName,
    required this.duration,
    required this.overview,
    required this.medications,
    required this.hydration,
    required this.restrictions,
  });
}
