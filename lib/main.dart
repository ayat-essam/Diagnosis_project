import 'package:device_preview/device_preview.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/login_screen.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Reset%20Password/cheack_password.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/slider_bar.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctors/doctors_screen.dart';
import 'package:diagnosis_project/Feature/Doctor/Finance_Doctor/presentation/screens/recent_transactions_screen.dart';
import 'package:diagnosis_project/Feature/Guest%20Book%20Apoinment/Presention/screens/guest_book_apointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/DI/depancicy_injection.dart';
import 'Feature/Doctor/Appointments/Presention/pages/appointments_page.dart';
import 'Feature/Doctor/Finance_Doctor/presentation/screens/finance_doctor_screen.dart';

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
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RecentTransactionsScreen()//DoctorsScreen(),
        );
      },
      child: const SliderBar(),


    );
  }
}
