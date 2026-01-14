import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import '../../../../Core/DI/get_it.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/reusable_widgets/custom_app_bar.dart';
import '../../../../Core/reusable_widgets/custom_text.dart';
import '../../../DashBoard Patient/presention/Widgets/slider_bar.dart';
import '../cubit/physio_cubit.dart';
import '../widgets/droplist_item.dart';
import '../widgets/exercise_card.dart';
import '../widgets/exercise_data.dart';
import '../widgets/physio_header.dart';

class PhysiotherapyScreen extends StatefulWidget {
  const PhysiotherapyScreen({super.key});

  @override
  State<PhysiotherapyScreen> createState() => _PhysiotherapyScreenState();
}

class _PhysiotherapyScreenState extends State<PhysiotherapyScreen> {
  String? selectedExercise;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PhysiotherapyCubit>(),
      child: Scaffold(
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
                    PhysioHeader(selectedExercise: selectedExercise),
                    Gap(16.h),
                    CustomBodyPartDropdown(
                      onChanged: (String? value) {
                        setState(() {
                          selectedExercise = value;
                        });
                        print("Selected Exercise: $value");
                      },
                    ),
                    Gap(16.h),
                    CustomText(
                      text: "Exercise Library",
                      fontSize: 16.sp,
                      color: AppColors.graySecondary,
                      fontWeight: Fonts.bold,
                    ),
                    Gap(16.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: exercises.length,
                      separatorBuilder: (_, __) => Gap(16.h),
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
      ),
    );
  }
}