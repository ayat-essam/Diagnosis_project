import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/physiotherapy_result_entity.dart';
import '../../domain/repository/physiotherapy_repository.dart';
import '../data_source/base_physiotherapy_remote_data_source.dart';
import '../model/physiotherapy_result_model.dart';


@LazySingleton(as: PhysiotherapyRepository)
class PhysiotherapyRepositoryImpl implements PhysiotherapyRepository {
  final BasePhysiotherapyRemoteDataSource remoteDataSource;

  PhysiotherapyRepositoryImpl(this.remoteDataSource);

  @override
  Future<PhysiotherapyResultEntity> submitVideo({
    required PlatformFile video,
    required String exerciseName,
  }) async {
    try {
      final response = await remoteDataSource.submitVideo(
        video: video,
        exerciseName: exerciseName,
      );

      return PhysiotherapyResultModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to submit video: $e');
    }
  }
}