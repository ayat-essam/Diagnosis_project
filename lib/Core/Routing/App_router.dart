
import 'package:diagnosis_project/Core/Routing/routes.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/dash_board.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/slider_bar.dart';
import 'package:flutter/material.dart';
import '../../Feature/Auth/HomePage.dart';
import '../../Feature/Auth/Presention/Login Screen/login_screen.dart';
import '../../Feature/Auth/Presention/Register Screen/register_screen.dart';



class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      // case Routers.LoginScr:
      //   return MaterialPageRoute(builder: (_) =>  BlocProvider(
      //       create: ( context) => getIt<LoginCubit>(),
      //       child: const LoginScr(isPassword: false,)));

      case Routers.LoginScreen:
        return MaterialPageRoute(builder: (_) =>  LoginScreen(),);

      case Routers.DashBoard:
        return MaterialPageRoute(builder: (_) =>  DashBoard());

      case Routers.SliderBar:
        return MaterialPageRoute(builder: (_) =>  SliderBar());


      case Routers.RegisterScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

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