import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DiagnocsisTempletContainer extends StatelessWidget {
  const DiagnocsisTempletContainer({
    super.key,
    required this.title,
    required this.backgroundImageColor,
    required this.imgPath,
  });

  final String title;
  final Color backgroundImageColor;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2.h,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: backgroundImageColor,
                    child: Image.asset(
                      imgPath,
                    ),
                  ),
                  Gap(12.h),
                  Text(title, style: StyleApp.font12BlackSemiBold),
                  Gap(4.h)
                ],
              ),
              Gap(12.h),
              CustomAppButton(
                onTap: () {},
                text: 'Use template',
                width: 180.w,
                borderRedius: 25.r,
              )
            ],
          ),
        ),
      ),
    );
  }
}
