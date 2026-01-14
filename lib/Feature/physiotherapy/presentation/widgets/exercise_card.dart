import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import 'package:diagnosis_project/Core/utils/you_tube_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/utils/youtube_utils.dart';
import 'exercise_data_model.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseDataModel exercise;

  const ExerciseCard({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.graySecondary),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => openYouTubeVideo(exercise.youtubeUrl),
            child: Container(
              height: 140.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    getYoutubeThumbnail(exercise.youtubeUrl),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.35),
                  ),
                  SvgPicture.asset(
                    'assets/image_SVG/vedioIcon.svg',
                    width: 56.w,
                    height: 56.w,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const Gap(8),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
                text: exercise.title,
                fontSize: 14.sp,
                color: AppColors.graySecondary,
                fontWeight: Fonts.bold),
            // child: Text(
            //   exercise.title,
            //   style: const TextStyle(fontWeight: FontWeight.bold),
            // ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
                text: "${exercise.level} • ${exercise.duration} • ${exercise.bodyPart}",
                fontSize: 12.sp,
                color: Colors.grey,
                fontWeight: Fonts.medium),
            // child: Text(
            //   "${exercise.level} • ${exercise.duration} • ${exercise.bodyPart}",
            //   style: const TextStyle(color: Colors.grey),
            // ),
          ),
          const Gap(10),
          CustomButton(
            text: "Play",
            onPressed: () => openYouTubeVideo(exercise.youtubeUrl),
            width: double.infinity,
            height: 40,
            backgroundColor: AppColors.BluePrimary,
            textColor: AppColors.whiteBackground,
          ),
          const Gap(10),
        ],
      ),
    );
  }
}