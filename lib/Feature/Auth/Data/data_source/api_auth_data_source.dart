import 'package:diagnosis_project/Feature/Auth/Data/data_source/auth_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthDataSource)
class ApiAuthDataSource extends AuthDataSource {}
