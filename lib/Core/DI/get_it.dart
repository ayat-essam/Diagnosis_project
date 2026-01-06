import 'package:diagnosis_project/Feature/Admin/doctors_management/data/datasource/doctor_management_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/datasource/doctor_management_remote_data_source_imp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/repositories/doctors_management_repo_imp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/add_doctor_use_case.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/doctors_mangement_repo.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_cubit.dart';
import 'package:diagnosis_project/Feature/Settings/data/datasource/profile_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Settings/data/datasource/user_settings_data_source.dart';
import 'package:diagnosis_project/Feature/Settings/data/repositories/pofile_repository_imp.dart';
import 'package:diagnosis_project/Feature/Settings/data/repositories/user_settings_repository_imp.dart';
import 'package:diagnosis_project/Feature/Settings/domain/repositories/profile_repository.dart';
import 'package:diagnosis_project/Feature/Settings/domain/repositories/user_settings_repository.dart';
import 'package:diagnosis_project/Feature/Settings/domain/usecases/get_profile_use_case.dart';
import 'package:diagnosis_project/Feature/Settings/domain/usecases/get_user_settings_use_case.dart';
import 'package:diagnosis_project/Feature/Settings/domain/usecases/update_profile_use_case.dart';
import 'package:diagnosis_project/Feature/Settings/domain/usecases/update_user_settings_use_case.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/cubit/profile_cubit.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/cubit/user_settings_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/api/dio_consumer.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  // ---------------- Data Layer (DoctorManagement Data Sources) ----------------
  sl.registerLazySingleton<DoctorManagementRemoteDataSource>(
    () => DoctorManagementRemoteDataSourceImp(sl()),
  );
  // ---------------- Data Layer (DoctorManagement Repositories) ----------------
  sl.registerLazySingleton<DoctorsManagementRepo>(
    () => DoctorsManagementRepoImp(dataSource: sl()),
  );
  // ---------------- Domain Layer (DoctorManagement Use Cases) ----------------
  sl.registerLazySingleton(() => AddDoctorUseCase(sl()));

  sl.registerFactory(() => AddDoctorCubit(sl()));

// ---------------- Data Layer ( Profile Data Source) ----------------
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImp(sl()),
  );
  // ---------------- Data Layer (Profile Repositories) ----------------
  sl.registerLazySingleton<ProfileRepository>(
    () => PofileRepositoryImp(profileRemoteDataSource: sl()),
  );
  // ---------------- Domain Layer (Profile Use Cases) ----------------
  sl.registerLazySingleton(() => GetProfileUseCase(profileRepository: sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(profileRepository: sl()));

  sl.registerFactory(() => ProfileCubit(
        getProfileUseCase: sl(),
        updateProfileUseCase: sl(),
      ));

  // ---------------- Data Layer ( user settings Data Source) ----------------
  sl.registerLazySingleton<UserSettingsDataSource>(
    () => UserSettingsDataSourceImp(sl()),
  );
  // ---------------- Data Layer (user settings Repositories) ----------------
  sl.registerLazySingleton<UserSettingsRepository>(
    () => UserSettingsRepositoryImp(userSettingsDataSource: sl()),
  );
  // ---------------- Domain Layer (user settings Use Cases) ----------------
  sl.registerLazySingleton(
      () => GetUserSettingsUseCase(userSettingsRepository: sl()));
  sl.registerLazySingleton(
      () => UpdateUserSettingsUseCase(userSettingsRepository: sl()));

  sl.registerFactory(
    () => UserSettingsCubit(
      getUserSettingsUseCase: sl(),
      updateUserSettingsUseCase: sl(),
    ),
  );
}
