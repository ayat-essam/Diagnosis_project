import 'package:diagnosis_project/Feature/Treatment/domain/entities/prescription_entity.dart';

class AddPrescriptionModel extends PrescriptionEntity {
  AddPrescriptionModel({
    required super.medicationName,
    required super.dosage,
    required super.duration,
    required super.frequency,
    required super.instructions,
    super.notes,
  });

  Map<String, dynamic> toJson(int patientId) {
    return {
      "patient_id": patientId,
      "medication": medicationName,
      "dosage": dosage,
      "duration": duration,
      "frequency": frequency,
      "instructions": instructions,
      "notes": notes,
    };
  }

  factory AddPrescriptionModel.fromJson(Map<String, dynamic> json) {
    return AddPrescriptionModel(
        medicationName: json['medicationName'],
        dosage: json['dosage'],
        duration: json['duration'],
        frequency: json['frequency'],
        instructions: json['instructions']);
  }
}
