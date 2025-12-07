import 'package:diagnosis_project/Feature/Auth/HomePage.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Register%20Screen/register_screen.dart';
import 'package:diagnosis_project/Feature/Patient/Appointments/Presention/pages/appointments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/DI/depancicy_injection.dart';
import 'Core/Routing/routes.dart';
import 'Feature/Auth/Presention/Login Screen/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    builder: (context,child){

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:  child,
    );
      },
      child: const Appointments(),


    );
  }
}


