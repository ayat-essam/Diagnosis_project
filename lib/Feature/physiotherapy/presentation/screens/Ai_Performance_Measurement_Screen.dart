import 'package:diagnosis_project/Core/Theme%20App/Fonts.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import 'package:diagnosis_project/Feature/physiotherapy/presentation/widgets/camera_box_item.dart';
import 'package:diagnosis_project/Feature/physiotherapy/presentation/widgets/matrics_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../Core/reusable_widgets/custom_app_bar.dart';

class AIPerformanceScreen extends StatefulWidget {
  const AIPerformanceScreen({super.key});

  @override
  State<AIPerformanceScreen> createState() => _AIPerformanceScreenState();
}

class _AIPerformanceScreenState extends State<AIPerformanceScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: CustomAppBar(
          showMenu: true,
          onMenuTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          showLogo: true,
          logoPath: "assets/image/logo2.png",
          appName: "Diagnosis",
          notificationCount: 5,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Container(
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
            decoration: BoxDecoration(
                color: AppColors.whiteBackground,
                borderRadius: BorderRadius.circular(20.r)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: 'AI Performance Measurement',
                      fontSize: 16.sp,
                      color: AppColors.grayTextChart,
                      fontWeight: Fonts.bold),
                  Gap(8.h),
                  const CameraBoxItem(),
                  Gap(16.h),
                  const MetricsCardItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
