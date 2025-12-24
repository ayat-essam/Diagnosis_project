import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FinanceHeader extends StatelessWidget {
  const FinanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Finance dashboard',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Gap(4),
        const Text(
          'Monitor your earnings and financial\nperformance',
          style: TextStyle(
              color: AppColors.graySecondary,
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.BluePrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
            ),
            onPressed: () {},
            child: const Text('Request withdrawal',
              style: TextStyle(
                  color: AppColors.whiteBackground,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
