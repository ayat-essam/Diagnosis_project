import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/datasources/system_settings_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/datasources/system_settings_remote_data_source_imp.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/repositories/system_settings_repository_impl.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/add_admin_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/get_reply_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/send_message_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/send_reply_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/set_ai_rate_limit_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/set_doctor_limit_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/set_doctor_work_hour_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/toggle_ai_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/cubit/AI_Diagnosis_cubit/ai_diagnosis_settings_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/cubit/DoctorWork/doctor_work_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/cubit/addAdmin/add_admin_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/datasource/doctor_management_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/datasource/doctor_management_remote_data_source_imp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/repositories/doctors_management_repo_imp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/usecases/add_doctor_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/repos/doctors_mangement_repo.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/usecases/deactivate_doctor_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/usecases/get_doctor_profile_use_case.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/usecases/get_doctors_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/data/datasource/patient_management_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/data/datasource/patient_management_remote_data_source_imp.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/data/repositories/patients_management_repo_imp.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/repos/patient_mangement_repo.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/usecases/delete_patient_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/usecases/get_patient_profile_use_case.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/usecases/get_patients_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
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
  sl.registerLazySingleton(() => GetDoctorsUseCase(sl()));
  sl.registerLazySingleton(() => GetDoctorProfileUseCase(sl()));
  sl.registerLazySingleton(() => DeactivateDoctorUsecase(sl()));

  sl.registerFactory(() => AddDoctorCubit(sl()));
  sl.registerFactory(() => DoctorsManagementCubit(
      getDoctorProfileUseCase: sl(), getDoctorsUseCase: sl(),
      deactivateDoctorUsecase: sl()));
  // ---------------- Data Layer (Patientmangement Data Sources) ----------------
  sl.registerLazySingleton<PatientManagementRemoteDataSource>(
    () => PatientManagementRemoteDataSourceImp(sl()),
  );
  // ---------------- Data Layer (Patientmangement Repositories) ----------------
  sl.registerLazySingleton<PatientMangementRepo>(
    () => PatientsManagementRepoImp(dataSource: sl()),
  );
  // ---------------- Domain Layer (Patientmangement Use Cases) ----------------
  sl.registerLazySingleton(() => DeletePatientUsecase(sl()));
  sl.registerLazySingleton(() => GetPatientsUsecase(sl()));
  sl.registerLazySingleton(() => GetPatientProfileUseCase(sl()));

  sl.registerFactory(() => PatientsMangementCubit(
      getPatientsUsecase: sl(), getPatientProfileUseCase: sl(),
      deletePatientUsecase: sl()));

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

  // ---------------- Data Layer (SystemSettings Data Source) ----------------
  sl.registerLazySingleton<SystemSettingsDataSource>(
    () => SystemSettingsDataSourceImpl(apiConsumer: sl()),
  );

  // ---------------- Data Layer (SystemSettings Repository) ----------------
  sl.registerLazySingleton<SystemSettingsRepository>(
    () => SystemSettingsRepositoryImpl(systemSettingsDataSource: sl()),
  );

  // ---------------- Domain Layer (SystemSettings Use Cases) ----------------
  sl.registerLazySingleton(
    () => AddAdminUseCase(repository: sl()),
  );

  sl.registerLazySingleton(
    () => SetAiRateLimitUseCase(repository: sl()),
  );

  sl.registerLazySingleton(
    () => SetDoctorRateLimitUseCase(repository: sl()),
  );

  sl.registerLazySingleton(
    () => SetDoctorWorkHourUseCase(repository: sl()),
  );

  sl.registerLazySingleton(
    () => ToggleAiUseCase(repository: sl()),
  );

  sl.registerLazySingleton(
    () => SendMessageUseCase(repository: sl()),
  );

  sl.registerLazySingleton(
    () => SendReplyUseCase(repository: sl()),
  );

  sl.registerLazySingleton(
    () => GetReplyUseCase(repository: sl()),
  );

  sl.registerFactory(() => AddAdminCubit(sl()));
  sl.registerFactory(
    () => AiDiagnosisSettingsCubit(
        setAiRateLimitUseCase: sl(), toggleAiUseCase: sl()),
  );
  sl.registerFactory(
    () => DoctorWorkCubit(
        setDoctorRateLimitUseCase: sl(), setDoctorWorkHourUseCase: sl()),
  );
}
