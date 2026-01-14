import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:injectable/injectable.dart';
import 'base_physiotherapy_remote_data_source.dart';

@LazySingleton(as: BasePhysiotherapyRemoteDataSource)
class PhysiotherapyRemoteDataSourceImpl
    implements BasePhysiotherapyRemoteDataSource {
  final ApiConsumer apiConsumer;

  PhysiotherapyRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<dynamic> submitVideo({
    required PlatformFile video,
    required String exerciseName,
  }) async {
    if (video.path == null) {
      throw Exception('Video file path is null');
    }

    final formData = FormData.fromMap({
      'videoFile': await MultipartFile.fromFile(
        video.path!,
        filename: video.name,
      ),
      'exerciseName': exerciseName,
    });

    return await apiConsumer.post(
      'PhysiotherapyExercise/submit-video',
      data: formData,
      isFormData: true,
    );
  }
}