import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/profile_model.dart';
import 'package:diagnosis_project/Feature/Settings/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository profileRepository;

  UpdateProfileUseCase({required this.profileRepository});

  Future<Either<ErrorModel, void>> call(
      {required ProfileModel profileModel}) async {
    return await profileRepository.updateProfile(
        updateProfileRequest: profileModel);
  }
}
