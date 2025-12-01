
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../Core/Routing/routes.dart';
import 'Presention/Login Screen/reusable_widgets/custom_button.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image/doctor.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo and Text Row
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.medical_services,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Diagnosis',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  Column(
                    children: [
                      CustomButton(
                          onTap: () {
                            Navigator.pushNamed(context, Routers.LoginScreen);
                          }, text: "Doctor"),
                      Gap(20),
                      CustomButton(
                          onTap: () {
                            Navigator.pushNamed(context, Routers.LoginScreen);
                          },
                          text: "Patient"),
                    ],
                  ),

                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}