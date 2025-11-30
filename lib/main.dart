import 'package:flutter/material.dart';
import 'Core/DI/depancicy_injection.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:  LoginScreen(),
    );
  }
}


