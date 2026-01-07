import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagnosis_project/Feature/Settings/domain/usecases/get_user_settings_use_case.dart';
import 'package:diagnosis_project/Feature/Settings/domain/usecases/update_user_settings_use_case.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/user_settings_model.dart';
import 'user_settings_state.dart';

class UserSettingsCubit extends Cubit<UserSettingsState> {
  final GetUserSettingsUseCase getUserSettingsUseCase;
  final UpdateUserSettingsUseCase updateUserSettingsUseCase;

  UserSettingsCubit({
    required this.getUserSettingsUseCase,
    required this.updateUserSettingsUseCase,
  }) : super(const UserSettingsState());


  Future<void> getUserSettings() async {
    emit(state.copyWith(isLoading: true,));

    final result = await getUserSettingsUseCase();

    result.fold(
      (error) => emit(
        state.copyWith(
          isLoading: false,
          errorModel: error,
        ),
      ),
      (settings) => emit(
        state.copyWith(
          isLoading: false,
          receiveEmailNotifications: settings.receiveEmailNotifications,
          twoFactorEnabled: settings.twoFactorEnabled,
        ),
      ),
    );
  }

  Future<void> updateUserSettings() async {
    emit(state.copyWith(isLoading: true,));

    final result = await updateUserSettingsUseCase(
      userSettingsModel: UserSettingsModel(
        receiveEmailNotifications: state.receiveEmailNotifications,
        twoFactorEnabled: state.twoFactorEnabled,
      ),
    );

    result.fold(
      (error) => emit(state.copyWith(isLoading: false, errorModel: error)),
      (_) => emit(state.copyWith(isLoading: false, isUpdated: true)),
    );
  }

  void changeReceiveEmailNotifications(bool value)async {
    emit(state.copyWith(receiveEmailNotifications: value));

   await updateUserSettings();
  }

  void changeTwoFactorEnabled(bool value)async {
    emit(state.copyWith(twoFactorEnabled: value));

   await updateUserSettings();
  }
}
