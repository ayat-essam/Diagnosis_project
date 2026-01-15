import 'package:diagnosis_project/Core/Theme%20App/Fonts.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/widgets/custom_button.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/presention/patient_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../Core/Theme App/styleApp.dart';

class CheckPassword extends StatelessWidget {
  const CheckPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// <<<<<<< HEAD
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            "assets/image/doctor.png",
            fit: BoxFit.cover,
          )),
          Positioned.fill(
            child: Container(
              color: AppColors.blackSecondary.withOpacity(0.5),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 120, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Reset Password Successful!",
                        style: StyleApp.font40whiteRegular,
                      ),
                      Image.asset("assets/image/check mark.png"),
                      Gap(50.h),
                      Text(
                        "Your password has been reset successfully!\n "
                        "Now you can log in with your new password.",
                        style: StyleApp.font16WhiteMedium
                            .copyWith(fontWeight: Fonts.regular),
                      ),
                      Gap(66.h),
                      CustomButton(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PatientDashboard(),
                                ));
                          },
                          text: "Confirm")
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
// =======
//       body: Stack(
//         children: [
//           Positioned.fill(
//               child: Image.asset(
//             "assets/image/doctor.png",
//             fit: BoxFit.cover,
//           )),
//           Positioned.fill(
//             child: Container(
//               color: AppColors.blackSecondary.withOpacity(0.5),
//             ),
//           ),
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 120, horizontal: 10),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Reset Password Successful!",
//                         style: StyleApp.font40whiteRegular,
//                       ),
//                       Image.asset("assets/image/check mark.png"),
//                       Gap(50.h),
//                       Text(
//                         "Your password has been reset successfully!\n "
//                         "Now you can log in with your new password.",
//                         style: StyleApp.font16WhiteMedium
//                             .copyWith(fontWeight: Fonts.regular),
//                       ),
//                       Gap(66.h),
//                       CustomButton(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => DashBoard(),
//                                 ));
//                           },
//                           text: "Confirm")
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
// >>>>>>> Consultations-features
    );
  }
}
