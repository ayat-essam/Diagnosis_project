import '../../Domain/Entities/drug_check_entity.dart';

class DrugCheckModel extends DrugCheckEntity {
  DrugCheckModel({
    required super.dosage,
    required super.age,
    required super.interactions,
    required super.contraindications,
    required super.commonSideEffects,
    required super.seriousSideEffects,
  });

  factory DrugCheckModel.fromJson(Map<String, dynamic> json) {
    return DrugCheckModel(
      dosage: json['dosage'],
      age: json['age'],
      interactions: json['interactions'],
      contraindications: json['contraindications'],
      commonSideEffects: json['sideEffects']['common'],
      seriousSideEffects: json['sideEffects']['serious'],
    );
  }
}
