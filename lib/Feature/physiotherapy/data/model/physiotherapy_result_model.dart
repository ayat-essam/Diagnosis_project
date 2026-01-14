import '../../domain/entity/physiotherapy_result_entity.dart';

class PhysiotherapyResultModel extends PhysiotherapyResultEntity {
  PhysiotherapyResultModel({
    required super.exerciseName,
    required super.errors,
    required super.feedback,
  });

  factory PhysiotherapyResultModel.fromJson(Map<String, dynamic> json) {
    final message = json['message'] ?? {};
    return PhysiotherapyResultModel(
      exerciseName: message['exercise'] ?? '',
      errors: (message['error'] != null) ? (message['error'] as num).toDouble() : 0.0,
      feedback: message['feedback'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercise': exerciseName,
      'error': errors,
      'feedback': feedback,
    };
  }
}
