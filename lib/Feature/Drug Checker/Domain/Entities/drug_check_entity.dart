class DrugCheckEntity {
  final String dosage;
  final String age;
  final String interactions;
  final String contraindications;
  final String commonSideEffects;
  final String seriousSideEffects;

  DrugCheckEntity({
    required this.dosage,
    required this.age,
    required this.interactions,
    required this.contraindications,
    required this.commonSideEffects,
    required this.seriousSideEffects,
  });
}
