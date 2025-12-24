import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [
        Color(0xff207EFF),
        Color(0xffC6D8FD),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(1.7),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Patient Reports',
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: AppColors.blackSecondary,
                            fontWeight: FontWeight.w500)),
                    Spacer(),
                    Image.asset('assets/image/Report.png'),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Text('View and manage your comprehensive medical files.',
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: AppColors.blackSecondary,
                        fontWeight: FontWeight.w400)),
              ],
            )));
  }
}
