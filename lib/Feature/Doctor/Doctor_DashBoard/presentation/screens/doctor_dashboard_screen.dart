import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_bar_widget.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/buttons_taps.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/common_diagnosis_chart.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/new_vs_returning_chart.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/rating_chart.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/row_doctor_dash_board_container.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/slider_bar_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBarWidget(),
      ),
      drawer: const SliderBarDoctor(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
          child: Column(
            children: [
              const ButtonsTaps(),
              Gap(16.h),
              const RowDoctorDashBoardContainer(),
              Gap(16.h),
              const NewVsReturningChart(),
              Gap(16.h),
              const RatingChart(),
              Gap(16.h),
              const CommonDiagnosisChart(),
            ],
          ),
        ),
      ),
    );
  }
}
