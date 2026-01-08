import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagnosis_project/Feature/Settings/domain/usecases/get_profile_use_case.dart';
import 'package:diagnosis_project/Feature/Settings/domain/usecases/update_profile_use_case.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/profile_model.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileState());

  void onFullNameChanged(String val) => emit(state.copyWith(fullName: val));

  void onEmailChanged(String val) => emit(state.copyWith(email: val));

  void onPhoneChanged(String val) => emit(state.copyWith(phoneNumber: val));

  Future<void> getProfile() async {
    emit(state.copyWith(isLoading: true));

    final result = await getProfileUseCase();

    result.fold(
      (error) => emit(
        state.copyWith(isLoading: false, errorModel: error),
      ),
      (profile) => emit(
        state.copyWith(
          isLoading: false,
          fullName: profile.fullName,
          email: profile.email,
          phoneNumber: profile.phoneNumber,
        ),
      ),
    );
  }

  Future<void> updateProfile() async {
    emit(state.copyWith(isLoading: true));

    final request = ProfileModel(
      fullName: state.fullName,
      email: state.email,
      phoneNumber: state.phoneNumber,
    );
    final result = await updateProfileUseCase(profileModel: request);

    result.fold(
      (error) => emit(
        state.copyWith(isLoading: false, errorModel: error),
      ),
      (_) => emit(
        state.copyWith(isLoading: false, isUpdated: true),
      ),
    );
  }
}
