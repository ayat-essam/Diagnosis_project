import 'package:device_preview/device_preview.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/login_screen.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/slider_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/DI/depancicy_injection.dart';
import 'Feature/Diagnosis Module/Diagnosis_Module_Screen.dart';
import 'Feature/SuggestedTreatment/presentation/view/suggested_treatment.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  
  runApp(
    DevicePreview(
      enabled: true,
      builder: (_) => const MyApp(),
    ),
  );
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
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home:  DiagnosisModuleScreen(),//RecentTransactionsScreen(),
        );
      },
      child: const SliderBar(),


    );
  }
}
