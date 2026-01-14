import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../cubit/physio_cubit.dart';
import 'upload_video_dialog.dart';
import '../../../../Core/reusable_widgets/custom_button.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';

class PhysioHeader extends StatefulWidget {
  final String? selectedExercise;

  const PhysioHeader({super.key, this.selectedExercise});

  @override
  State<PhysioHeader> createState() => _PhysioHeaderState();
}

class _PhysioHeaderState extends State<PhysioHeader> {
  // في _showUploadDialog في physio_header.dart
  void _showUploadDialog() {
    if (widget.selectedExercise == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select an exercise first"),
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: BlocProvider.of<PhysiotherapyCubit>(context), // ✅ هذا مهم
        child: UploadVideoDialog(
          onVideoSelected: (file) {
            if (file != null) {
              print("Video selected: ${file.name}");
            }
          },
          selectedExercise: widget.selectedExercise,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/image_SVG/Physiotherapy.svg',
              color: AppColors.BluePrimary,
              width: 15.w,
              height: 15.h,
            ),
            Gap(10.w),
            CustomText(
              text: "Physiotherapy",
              fontSize: 22.sp,
              color: AppColors.grayTextChart,
              fontWeight: Fonts.bold,
            ),
          ],
        ),
        Gap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(
                  text: "Upload Video",
                  onPressed: _showUploadDialog,
                  width: 150.w,
                  height: 30.h,
                  backgroundColor: widget.selectedExercise != null
                      ? AppColors.BluePrimary
                      : Colors.grey,
                  textColor: AppColors.whiteBackground,
                ),
                if (widget.selectedExercise != null) ...[
                  Gap(4.h),
                  CustomText(
                    text: "Selected: ${widget.selectedExercise}",
                    fontSize: 10.sp,
                    color: AppColors.BluePrimary,
                    fontWeight: Fonts.medium,
                  ),
                ]
              ],
            ),
            Gap(8.w),
            CustomText(
              text: "Active",
              fontSize: 12.sp,
              color: AppColors.BluePrimary,
              fontWeight: Fonts.bold,
            ),
          ],
        ),
      ],
    );
  }
}