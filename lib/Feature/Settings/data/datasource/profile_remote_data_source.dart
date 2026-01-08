import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<void> updateProfile(
      {required ProfileModel profileModel});
}

class ProfileRemoteDataSourceImp implements ProfileRemoteDataSource {
  ApiConsumer apiConsumer;
  ProfileRemoteDataSourceImp(this.apiConsumer);
  @override
  Future<ProfileModel> getProfile() async {
    final response = await apiConsumer.get("/Settings/profile");
    return ProfileModel.fromJson(response);
  }

  @override
  Future<void> updateProfile(
      {required ProfileModel profileModel}) async {
    await apiConsumer.put(
      "/Settings/profile",
      data: profileModel.toJson(),
    );
  }
}
