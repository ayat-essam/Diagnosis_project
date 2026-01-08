import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/user_settings_model.dart';

abstract class UserSettingsDataSource {
  Future<UserSettingsModel> getUserSettings();
  Future<void> updateUserSettings(
      {required UserSettingsModel userSettingsModel});
}

class UserSettingsDataSourceImp implements UserSettingsDataSource {
  ApiConsumer apiConsumer;
  UserSettingsDataSourceImp(this.apiConsumer);
  @override
  Future<UserSettingsModel> getUserSettings() async {
    final response = await apiConsumer.get("/Settings/user-settings");
    return UserSettingsModel.fromJson(response);
  }

  @override
  Future<void> updateUserSettings(
      {required UserSettingsModel userSettingsModel}) async {
    await apiConsumer.put(
      "/Settings/user-settings",
      data: userSettingsModel.toJson(),
    );
  }
}
