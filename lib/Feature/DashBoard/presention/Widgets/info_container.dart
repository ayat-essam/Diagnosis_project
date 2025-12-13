import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imgPath,
    required this.isSelected,
  });

  final String title;
  final String subtitle;
  final String description;
  final String imgPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: isSelected == true
                ? AppColors.BluePrimary
                : AppColors.greyLight,
            borderRadius: BorderRadius.circular(20),
            border: isSelected == true
                ? null
                : Border.all(color: AppColors.whiteBackground, width: 2.w)),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2.h,
            children: [
              CircleAvatar(
                backgroundColor: isSelected == true
                    ? AppColors.whiteBackground
                    : AppColors.BluePrimary,
                child: Image.asset(imgPath,
                    width: 40.w,
                    height: 40.h,
                    color: isSelected == true
                        ? AppColors.black
                        : AppColors.whiteBackground),
              ),
              const SizedBox(height: 12),
              Text(title,
                  style: isSelected == true
                      ? StyleApp.font12WhiteSemiBold
                      : StyleApp.font12BlackSemiBold),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: isSelected == true
                      ? StyleApp.font16WhiteSemiBold
                      : StyleApp.font16BlueSemiBold),
              const SizedBox(height: 4),
              Text(description,
                  style: isSelected == true
                      ? StyleApp.font12WhiteSemiBold
                      : StyleApp.font12BlackSemiBold),
            ],
          ),
        ),
      ),
    );
  }
}
