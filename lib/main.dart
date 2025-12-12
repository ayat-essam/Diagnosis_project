import 'package:device_preview/device_preview.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/login_screen.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Reset%20Password/cheack_password.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/slider_bar.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/patient_dashboard.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctors/doctors_screen.dart';
import 'package:diagnosis_project/Feature/Guest%20Book%20Apoinment/Presention/screens/guest_book_apointment_screen.dart';
import 'package:diagnosis_project/Feature/Reports/presentation/views/reports_view.dart';
import 'package:diagnosis_project/Feature/services/presentation/views/services_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/DI/depancicy_injection.dart';
import 'Feature/Doctor/Appointments/Presention/pages/appointments_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PatientDashboard()//DoctorsScreen(),
        );
      },
      child: SliderBar(),


    );
  }
}
