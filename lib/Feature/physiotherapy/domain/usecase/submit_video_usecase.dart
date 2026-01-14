import 'package:file_picker/file_picker.dart';

import '../repository/physiotherapy_repository.dart';
import '../entity/physiotherapy_result_entity.dart';

class SubmitVideoUseCase {
  final PhysiotherapyRepository repository;

  SubmitVideoUseCase(this.repository);

  Future<PhysiotherapyResultEntity> call({
    required PlatformFile video,
    required String exerciseName,
  }) {
    return repository.submitVideo(
      video: video,
      exerciseName: exerciseName,
    );
  }
}