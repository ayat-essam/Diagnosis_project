import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Admin_dashBoard/data/models/info_admin_dash_board_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AdminDashboardInfoContainer extends StatelessWidget {
  const AdminDashboardInfoContainer({
    super.key,
    required this.infoAdminDashBoardModel,
    required this.isSelected,
  });

  final InfoAdminDashBoardModel infoAdminDashBoardModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = isSelected == true
        ? StyleApp.font12WhiteMedium
        : StyleApp.font10blackSecondryMedium.copyWith(fontSize: 12.sp);
    final TextStyle subTitleTextStyle = isSelected == true
        ? StyleApp.font12WhiteRegular
        : StyleApp.font12WhiteRegular.copyWith(
            color: AppColors.black,
          );
    final Color backgroundColor =
        isSelected == true ? AppColors.BluePrimary : AppColors.greyLight;

    return CustomLinearGradiantContainer(
      borderRadius: 6,
      color: backgroundColor,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(infoAdminDashBoardModel.title, style: titleTextStyle),
                  Gap(15.w),
                  CircleAvatar(
                    radius: 12.r,
                    backgroundColor: isSelected == true
                        ? AppColors.whiteBackground
                        : AppColors.BluePrimary,
                    child: SvgPicture.asset(infoAdminDashBoardModel.imgPath,
                        width: 15.w,
                        height: 15.h,
                        color: isSelected == true
                            ? AppColors.graySecondary
                            : AppColors.whiteBackground),
                  ),
                ],
              ),
              Gap(4.h),
              Text(infoAdminDashBoardModel.subtitle,
                  style: isSelected == true
                      ? StyleApp.font16WhiteSemiBold
                      : StyleApp.font16BlueSemiBold),
              Gap(4.h),
              Text(infoAdminDashBoardModel.description,
                  style: subTitleTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
