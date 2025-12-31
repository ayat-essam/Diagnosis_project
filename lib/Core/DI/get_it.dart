import 'package:diagnosis_project/Feature/Admin/doctors_management/data/datasource/doctor_management_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/datasource/doctor_management_remote_data_source_imp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/repositories/doctors_management_repo_imp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/add_doctor_use_case.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/doctors_mangement_repo.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/api/dio_consumer.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
 // sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));
  
  // ---------------- Data Layer (Data Sources) ----------------
  sl.registerLazySingleton<DoctorManagementRemoteDataSource>(
    () => DoctorManagementRemoteDataSourceImp(sl()),
  );
  // ---------------- Data Layer (Repositories) ----------------
  sl.registerLazySingleton<DoctorsManagementRepo>(
    () => DoctorsManagementRepoImp(dataSource: sl()),
  );
  // ---------------- Domain Layer (Use Cases) ----------------
  sl.registerLazySingleton(() => AddDoctorUseCase(sl()));


  sl.registerFactory(() => AddDoctorCubit(sl()));

}
