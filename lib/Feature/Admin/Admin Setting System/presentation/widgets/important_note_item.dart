import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/widgets/setting_confirm_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../Core/Theme App/Fonts.dart';
import '../../../../../Core/Theme App/colors.dart';

class ImportantNoteCard extends StatelessWidget {
  const ImportantNoteCard({
    super.key,
  });
  void showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => ConfirmDialog(
        onConfirm: () {
          Navigator.pop(context);
          // TODO: save settings
        },
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
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
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFC6D8FD),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: Icon(
                    Icons.info_outline,
                    color: AppColors.BluePrimary,
                  ),
                ),
                Gap(8.w),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Important: ',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: Fonts.bold,
                            color: AppColors.grayDark,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Changes to system settings will affect all users and may impact system behavior. Please review carefully before saving.',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: Fonts.regular,
                            color: AppColors.gratext,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(12.h),
            CustomButton(
                text: 'Save Settings',
                onPressed: () {
                  showConfirmDialog(context);
                },
                width: 120.w,
                height: 40.h,
                backgroundColor: AppColors.BluePrimary,
                textColor: AppColors.whiteBackground)
          ],
        ),
      ),
    );
  }
}
