import 'package:file_picker/file_picker.dart';

import '../entity/physiotherapy_result_entity.dart';

abstract class PhysiotherapyRepository {
  Future<PhysiotherapyResultEntity> submitVideo({
    required PlatformFile video,
    required String exerciseName,
  });
}