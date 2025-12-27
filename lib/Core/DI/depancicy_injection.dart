import 'package:diagnosis_project/Core/DI/depancicy_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../Feature/Auth/Presention/Reset Password/view_models/forget_pass/forget_password_cubit.dart';
import '../../Feature/Auth/Presention/Reset Password/view_models/reset_pass/reset_pass_cubit.dart';
import '../api/api_consumer.dart';

final getIt = GetIt.instance;

@InjectableInit()
<<<<<<< HEAD
Future <void> configureDependencies() => getIt.init();

=======
Future<void> configureDependencies() => getIt.init();
>>>>>>> Consultations-features
