import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../data/models/info_container_model.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.infoContainerModel, required bool isSelected,
  });

  final InfoContainerModel infoContainerModel;

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: infoContainerModel.isSelected == true
                ? AppColors.BluePrimary
                : AppColors.greyLight,
            borderRadius: BorderRadius.circular(20),
            border: infoContainerModel.isSelected == true
                ? null
                : Border.all(color: AppColors.whiteBackground, width: 2.w)),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 2.h,
            children: [
              CircleAvatar(
                backgroundColor: infoContainerModel.isSelected == true
                    ? AppColors.whiteBackground
                    : AppColors.BluePrimary,
                child: Image.asset(infoContainerModel.imgPath,
                    width: 40.w,
                    height: 40.h,
                    color: infoContainerModel.isSelected == true
                        ? AppColors.black
                        : AppColors.whiteBackground),
              ),
              Gap(12.h),
              Text(infoContainerModel.title,
                  style: infoContainerModel.isSelected == true
                      ? StyleApp.font12WhiteSemiBold
                      : StyleApp.font12BlackSemiBold),
              Gap(4.h),
              Text(infoContainerModel.subtitle,
                  style: infoContainerModel.isSelected == true
                      ? StyleApp.font16WhiteSemiBold
                      : StyleApp.font16BlueSemiBold),
              Gap(4.h),
              Text(infoContainerModel.description,
                  style: infoContainerModel.isSelected == true
                      ? StyleApp.font12WhiteSemiBold
                      : StyleApp.font12BlackSemiBold),
            ],
          ),
        ),
      ),
    );
  }
}
