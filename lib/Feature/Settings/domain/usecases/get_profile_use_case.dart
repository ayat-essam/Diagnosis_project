import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Settings/domain/entities/profle_entity.dart';
import 'package:diagnosis_project/Feature/Settings/domain/repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository profileRepository;

  GetProfileUseCase({required this.profileRepository});

  Future<Either<ErrorModel, ProfileEntity>> call() async {
    return await profileRepository.getProfile();
  }
}
