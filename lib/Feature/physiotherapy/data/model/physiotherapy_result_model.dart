
import '../../domain/entity/physiotherapy_result_entity.dart';

class PhysiotherapyResultModel extends PhysiotherapyResultEntity {
  PhysiotherapyResultModel({
    required super.exerciseName,
    required super.errors,
    required super.feedback,
  });

  factory PhysiotherapyResultModel.fromJson(Map<String, dynamic> json) {
    return PhysiotherapyResultModel(
      exerciseName: json['exerciseName'] ?? '',
      errors: List<String>.from(json['errors'] ?? []),
      feedback: json['feedback'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exerciseName': exerciseName,
      'errors': errors,
      'feedback': feedback,
    };
  }
}