import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/DI/depancicy_injection.dart';
import 'Feature/Admin/presention/Widgets/slider_bar_admin.dart';
import 'Feature/Doctor/My Patient/Presention/my_patient_screen.dart';


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
              home: MyPatientsScreen() //DoctorsScreen(),


              );
        });
  }
}
