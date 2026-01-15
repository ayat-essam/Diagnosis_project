import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/presention/Widgets/grid_view_dashboard_container.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/presention/Widgets/patient_bar_chart.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_bar_widget.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/presention/Widgets/patient_line_chart.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/presention/Widgets/slider_bar.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/presention/manager/cubit/dash_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PatientDashboard extends StatelessWidget {
  const PatientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DashPatientCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: const CustomAppBarWidget(),
        ),
         //drawer: const SliderBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(22.h),
              const GridViewDashboardContainer(),
              Gap(27.h),
              Text('AI Physiotherapy Progress Overview',
                  style: StyleApp.font16BlackRegular),
              Gap(6.h),
              Text('Last 6 Months',
                  style:
                      StyleApp.font16BlackRegular.copyWith(color: Colors.grey)),
              Gap(12.h),
              const PatientLineChart(),
              Gap(24.h),
              Text('Symptom Severity Trends',
                  style: StyleApp.font16BlackRegular),
              Gap(6.h),
              Text('Current Week',
                  style:
                      StyleApp.font16BlackRegular.copyWith(color: Colors.grey)),
              Gap(11.h),
              const PatientBarChart(),
            ],
          ),
        ),
      ),
    );
  }
}
