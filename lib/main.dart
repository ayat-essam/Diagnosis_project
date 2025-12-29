import 'package:device_preview/device_preview.dart';
import 'package:diagnosis_project/Core/localization/cubit/locale_cubit.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/login_screen.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/presention/patient_dashboard.dart';
import 'package:diagnosis_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/DI/depancicy_injection.dart';
import 'Feature/Inquiries/Inquiries_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   // configureDependencies();

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
                home: Inquire(), 
              );
            },
          );
        });
  }
}
