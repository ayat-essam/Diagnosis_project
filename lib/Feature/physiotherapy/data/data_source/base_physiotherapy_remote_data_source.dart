
import 'package:file_picker/file_picker.dart';

abstract class BasePhysiotherapyRemoteDataSource {
  Future<dynamic> submitVideo({
    required PlatformFile video,
    required String exerciseName,
  });
}