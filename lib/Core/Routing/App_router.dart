import 'package:diagnosis_project/Core/Routing/routes.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/dash_board.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/slider_bar.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/patient_dashboard.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/Diagnosis_Module_Screen.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/about_us_view.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/guest_notification_view.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/terms-and-conditions.dart';
import 'package:flutter/material.dart';
import '../../Feature/Ai Diagnosis Result/Ai_Diagnosis_Result_Screen.dart';
import '../../Feature/Appointments/Appointments_Screen.dart';
import '../../Feature/Auth/HomePage.dart';
import '../../Feature/Auth/Presention/Login Screen/login_screen.dart';
import '../../Feature/Auth/Presention/Register Screen/register_screen.dart';
import '../../Feature/Complaints/presentation/screens/Complaints_Screen.dart';
//import '../../Feature/Complaints/Complaints_Screen.dart';

import '../../Feature/Directory/Director_ Screen.dart';
import '../../Feature/Drug Checker/Drug_Checker_Screen.dart';
import '../../Feature/Help/Help_Screen.dart';
import '../../Feature/Inquiries/Inquiries_Screen.dart';
import '../../Feature/Medical Files/Medical_Files_Screen.dart';
import '../../Feature/Settings/Settings_Screen.dart';
import '../../Feature/physiotherapy/Physiotherapy_Screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      // case Routers.LoginScr:
      //   return MaterialPageRoute(builder: (_) =>  BlocProvider(
      //       create: ( context) => getIt<LoginCubit>(),
      //       child: const LoginScr(isPassword: false,)));

      case Routers.LoginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      case Routers.DashBoard:
        return MaterialPageRoute(builder: (_) => const PatientDashboard());

      // Drawer Routers Items
      case Routers.diagnosisModule:
        return MaterialPageRoute(builder: (_) => const DiagnosisModuleScreen());
      case Routers.aiDiagnosisResult:
        return MaterialPageRoute(builder: (_) => AiDiagnosisResultScreen());
      case Routers.drugChecker:
        return MaterialPageRoute(builder: (_) => DrugCheckerScreen());
      case Routers.physiotherapy:
        return MaterialPageRoute(builder: (_) => PhysiotherapyScreen());
      case Routers.inquiries:
        return MaterialPageRoute(builder: (_) => InquiriesScreen());
      case Routers.complaints:
        return MaterialPageRoute(builder: (_) => ComplaintsScreen());
      case Routers.directory:
        return MaterialPageRoute(builder: (_) => DirectoryScreen());
      case Routers.appointments:
        return MaterialPageRoute(builder: (_) => AppointmentsScreen());
      case Routers.medicalFiles:
        return MaterialPageRoute(builder: (_) => MedicalFilesScreen());
      case Routers.settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case Routers.help:
        return MaterialPageRoute(builder: (_) => HelpScreen());

      case Routers.SliderBar:
        return MaterialPageRoute(builder: (_) => SliderBar());

      case Routers.RegisterScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case Routers.guestNotificationScreen:
        return MaterialPageRoute(builder: (_) => const GuestNotificationView());
      case Routers.termsAndConditions:
        return MaterialPageRoute(
            builder: (_) => const TermsAndConditionsView());
      case Routers.aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
