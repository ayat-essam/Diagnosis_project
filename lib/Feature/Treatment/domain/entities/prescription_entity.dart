class PrescriptionEntity {
  final String medicationName;
  final String dosage;
  final String duration;
  final String frequency;
  final String instructions;
  final String? notes;

  PrescriptionEntity({
    required this.medicationName,
    required this.dosage,
    required this.duration,
    required this.frequency,
    required this.instructions,
    this.notes,
  });
}

