// // GENERATED CODE - DO NOT MODIFY BY HAND
// // dart format width=80

// // **************************************************************************
// // InjectableConfigGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:diagnosis_project/Core/api/api_consumer.dart' as _i1067;
// import 'package:diagnosis_project/Core/api/dio_consumer.dart' as _i825;
// import 'package:diagnosis_project/Core/DI/depancicy_injection.dart' as _i828;
// import 'package:diagnosis_project/Core/DI/register_module.dart' as _i143;
// import 'package:diagnosis_project/Feature/Auth/data/data_source/api_auth_data_source.dart'
//     as _i221;
// import 'package:diagnosis_project/Feature/Auth/data/data_source/auth_data_source.dart'
//     as _i711;
// import 'package:diagnosis_project/Feature/Auth/data/data_source/Remote/auth_api_remote_data_source.dart'
//     as _i257;
// import 'package:diagnosis_project/Feature/Auth/data/data_source/Remote/auth_remote_data_sourse.dart'
//     as _i901;
// import 'package:diagnosis_project/Feature/Auth/Domain/auth_repository/auth_repo.dart'
//     as _i125;
// import 'package:diagnosis_project/Feature/Auth/Domain/UsesCase/login_use_case.dart'
//     as _i588;
// import 'package:diagnosis_project/Feature/Auth/Domain/UsesCase/register_use_case.dart'
//     as _i696;
// import 'package:diagnosis_project/Feature/Auth/Presention/cubit/auth_cubit.dart'
//     as _i90;
// import 'package:diagnosis_project/Feature/Inquiries/data/cubit/create_inquiry_cubit.dart'
//     as _i458;
// import 'package:diagnosis_project/Feature/Inquiries/data/cubit/patient_inquiries_cubit.dart'
//     as _i657;
// import 'package:diagnosis_project/Feature/Inquiries/data/datasource/inquiry_remote_datasource.dart'
//     as _i431;
// import 'package:diagnosis_project/Feature/Inquiries/data/datasource/inquiry_remote_datasource_imp.dart'
//     as _i44;
// import 'package:diagnosis_project/Feature/Inquiries/data/repository/inquiry_repository_impl.dart'
//     as _i88;
// import 'package:diagnosis_project/Feature/Inquiries/domain/repository/inquiry_repository.dart'
//     as _i969;
// import 'package:diagnosis_project/Feature/Inquiries/domain/usecases/create_inquiry_usecase.dart'
//     as _i529;
// import 'package:diagnosis_project/Feature/Inquiries/domain/usecases/get_patient_inquiries_usecase.dart'
//     as _i544;
// import 'package:dio/dio.dart' as _i361;
// import 'package:get_it/get_it.dart' as _i174;
// import 'package:injectable/injectable.dart' as _i526;
// import 'package:shared_preferences/shared_preferences.dart' as _i460;

// import '../../Feature/Inquiries/domain/usecases/create_inquiry_usecase.dart' as _i828;

// extension GetItInjectableX on _i174.GetIt {
// // initializes the registration of main-scope dependencies inside of GetIt
//   Future<_i174.GetIt> init({
//     String? environment,
//     _i526.EnvironmentFilter? environmentFilter,
//   }) async {
//     final gh = _i526.GetItHelper(
//       this,
//       environment,
//       environmentFilter,
//     );
//     final registerModule = _$RegisterModule();
//     await gh.factoryAsync<_i460.SharedPreferences>(
//       () => registerModule.getShardPref(),
//       preResolve: true,
//     );
//     gh.singleton<_i361.Dio>(() => registerModule.dio);
//     gh.singleton<_i901.AuthRemoteDataSource>(
//         () => _i257.AuthApiRemoteDataSource(gh<_i361.Dio>()));
//     gh.lazySingleton<_i588.LoginUseCase>(
//         () => _i588.LoginUseCase(gh<_i125.AuthRepo>()));
//     gh.lazySingleton<_i696.RegisterUseCase>(
//         () => _i696.RegisterUseCase(gh<_i125.AuthRepo>()));
//     gh.lazySingleton<_i711.AuthDataSource>(() => _i221.ApiAuthDataSource());
//     gh.lazySingleton<_i1067.ApiConsumer>(
//         () => _i825.DioConsumer(dio: gh<_i361.Dio>()));
//     gh.singleton<_i90.AuthCubit>(() => _i90.AuthCubit(
//           gh<_i696.RegisterUseCase>(),
//           gh<_i588.LoginUseCase>(),
//         ));
//     gh.lazySingleton<_i431.InquiryRemoteDataSource>(
//         () => _i44.InquiryRemoteDataSourceImpl(gh<_i1067.ApiConsumer>()));
//     gh.lazySingleton<_i969.InquiryRepository>(() => _i88.InquiryRepositoryImpl(
//         inquiryRemoteDataSource: gh<_i431.InquiryRemoteDataSource>()));
//     gh.factory<_i828.CreateInquiryUseCase>(
//         () => _i828.CreateInquiryUseCase(gh<_i969.InquiryRepository>()));
//     gh.factory<_i529.CreateInquiryUseCase>(
//         () => _i529.CreateInquiryUseCase(gh<_i969.InquiryRepository>()));
//     gh.factory<_i544.GetPatientInquiriesUseCase>(
//         () => _i544.GetPatientInquiriesUseCase(gh<_i969.InquiryRepository>()));
//     gh.factory<_i458.CreateInquiryCubit>(
//         () => _i458.CreateInquiryCubit(gh<_i529.CreateInquiryUseCase>()));
//     gh.factory<_i657.PatientInquiriesCubit>(() =>
//         _i657.PatientInquiriesCubit(gh<_i544.GetPatientInquiriesUseCase>()));
//     return this;
//   }
// }

// class _$RegisterModule extends _i143.RegisterModule {}
