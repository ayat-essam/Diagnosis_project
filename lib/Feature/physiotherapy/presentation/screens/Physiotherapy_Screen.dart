import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/reusable_widgets/custom_app_bar.dart';
import '../../../../Core/reusable_widgets/search_bar_widget.dart';
import '../../../DashBoard Patient/presention/Widgets/slider_bar.dart';
import '../../Data/exercise_data.dart';
import '../widgets/exercise_card.dart';
import '../widgets/physio_header.dart';

class PhysiotherapyScreen extends StatefulWidget {
  const PhysiotherapyScreen({super.key});

  @override
  State<PhysiotherapyScreen> createState() => _PhysiotherapyScreenState();
}

class _PhysiotherapyScreenState extends State<PhysiotherapyScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      key: _scaffoldKey,
      drawer: const SliderBar(),
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
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
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
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PhysioHeader(),
                  const SearchBarWidget(hintText: 'Search in Exercise Library....',),

                  CustomText(
                      text: "Exercise Library",
                      fontSize: 16.sp,
                      color: AppColors.graySecondary,
                      fontWeight: Fonts.bold),
               Gap(16.h),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: exercises.length,
                    separatorBuilder: (_, __) =>
                        Gap(16.h),
                    itemBuilder: (context, index) {
                      return ExerciseCard(exercise: exercises[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
