import 'package:device_preview/device_preview.dart';
import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/localization/cubit/locale_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_dashBoard/presentation/screens/admin_dashboard_screen.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_doctor_profile/presentation/views/admin_doctor-profile.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/admin_patient_profile.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/doctors_mangement_screen.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/login_screen.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Reset%20Password/cheack_password.dart';

import 'package:diagnosis_project/Feature/Consultations/presentation/views/Consultations_view.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/presention/patient_dashboard.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/Diagnosis_Module_Screen.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/doctor_dashboard_screen.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctors/presentation/screens/doctors_screen.dart';
import 'package:diagnosis_project/Feature/Doctor/Finance_Doctor/presentation/screens/recent_transactions_screen.dart';
import 'package:diagnosis_project/Feature/Guest%20Book%20Apoinment/Presention/screens/guest_book_apointment_screen.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/screens/treatment_mangment.dart';

import 'package:diagnosis_project/Feature/notifications/presentation/views/notification_screen.dart';
import 'package:diagnosis_project/Feature/services/presentation/views/services_view.dart';

import 'package:diagnosis_project/Feature/Guest%20Setting/views/guest_setting_view.dart';
import 'package:diagnosis_project/Feature/Patient/profile-patient/presentation/views/profile_patient_view.dart';
import 'package:diagnosis_project/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // configureDependencies();
  await setupServiceLocator();
  runApp(
    BlocProvider(
      create: (_) => LocaleCubit(),
      child: DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(),
      ),
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
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              Locale locale = const Locale('en');

              if (state is LocaleInitial) {
                locale = state.locale;
              } else if (state is LocaleChanged) {
                locale = state.locale;
              }

              return MaterialApp(
                  locale: locale,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  home: const PatientDashboard()

                //DoctorsScreen(),
              );
            },
          );
        });
  }
}
