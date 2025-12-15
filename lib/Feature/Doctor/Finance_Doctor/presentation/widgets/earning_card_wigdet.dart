import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/Theme App/colors.dart';
import 'dollar_icon_widget.dart';

class EarningCardWidget extends StatelessWidget {
  const EarningCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.dateSloteColor,
                AppColors.BluePrimary,
              ],
            ),
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
            width: 329,
            height: 184,
            padding: const EdgeInsets.fromLTRB(20, 36, 20, 20), // ⬅️ مهم
            decoration: BoxDecoration(
              color: AppColors.grayF2,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // ⬅️ يبدأ من فوق
              children: [
                Text(
                  'Total Earnings',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: AppColors.blackSecondary,
                  ),
                ),
                Gap( 4),
                Text(
                  '\$25,800',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: AppColors.blackSecondary,
                  ),
                ),
                Gap(8),
                Row(
                  children: [
                    Text(
                      "+10.2%",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: AppColors.green,
                      ),
                    ),

                    Text(
                      "vs last month",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: AppColors.blackSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const DollarIconWidget(),
      ],
    );


  }
}
