
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Guest%20Book%20Apoinment/Presention/screens/widgets/text_form_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterInformationSection extends StatelessWidget {
  const EnterInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Enter Your Information", style: StyleApp.font20BlackSemiBold),
        SizedBox(
          height: 20.h,
        ),
        const TextFormFiledCustom(
            hintText: "Full Name", icon: 'assets/image/Person_icon.png'),
        SizedBox(
          height: 10.h,
        ),
        const TextFormFiledCustom(
            hintText: "Email Address", icon: 'assets/image/Email.png'),
        SizedBox(
          height: 10.h,
        ),
        const TextFormFiledCustom(
            hintText: "Phone Number", icon: 'assets/image/Phone.png'),
      ],
    );
  }
}

