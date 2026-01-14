class PhysiotherapyResultEntity {
  final String exerciseName;
  final List<String> errors;
  final String feedback;

  PhysiotherapyResultEntity({
    required this.exerciseName,
    required this.errors,
    required this.feedback,
  });
}