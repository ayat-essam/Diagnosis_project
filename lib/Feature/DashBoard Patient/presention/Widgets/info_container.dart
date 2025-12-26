import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/data/models/info_container_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.infoContainerModel,
    required this.isSelected,
  });

  final InfoContainerModel infoContainerModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = isSelected == true
        ? StyleApp.font12WhiteSemiBold
        : StyleApp.font12BlackSemiBold
            .copyWith(color: AppColors.blackSecondary);
    final Color backgroundColor =
        isSelected == true ? AppColors.BluePrimary : AppColors.greyLight;

    return CustomLinearGradiantContainer(
      borderRadius: 12.r,
      color: backgroundColor,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2.h,
            children: [
              CircleAvatar(
                backgroundColor: isSelected == true
                    ? AppColors.whiteBackground
                    : AppColors.BluePrimary,
                child: SvgPicture.asset(infoContainerModel.imgPath,
                    width: 15.w,
                    height: 15.h,
                    color: isSelected == true
                        ? AppColors.grayDark
                        : AppColors.whiteBackground),
              ),
              Gap(12.h),
              Text(infoContainerModel.title, style: textStyle),
              Gap(4.h),
              Text(infoContainerModel.subtitle,
                  style: isSelected == true
                      ? StyleApp.font16WhiteSemiBold
                      : StyleApp.font16BlueSemiBold),
              Gap(4.h),
              Text(infoContainerModel.description, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
