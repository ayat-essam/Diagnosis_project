import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin_dashBoard/presentation/screens/widgets/admin_line_chart.dart';
import 'package:diagnosis_project/Feature/Admin_dashBoard/presentation/screens/widgets/list_view_admin_dashboard_info_container.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/bar_chart_widget.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/patient_dash_board_appbar.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/slider_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const PationDashBoardAppbar(),
      ),
      drawer: const SliderBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListViewAdminDashboardInfoContainer(),
              Gap(22.h),
              Text('Diagnosis Over Time',
                  style: StyleApp.font16BlackRegular),
              Gap(6.h),
              Text('Last 6 Months',
                  style:
                      StyleApp.font16BlackRegular.copyWith(color: Colors.grey)),
              Gap(12.h),
              const AdminLineChart(),
              Gap(24.h),
              Text('Top Diagnosis Doctors',
                  style: StyleApp.font16BlackRegular),
              Gap(6.h),
              Text('Current Week',
                  style:
                      StyleApp.font16BlackRegular.copyWith(color: Colors.grey)),
              Gap(11.h),
              const BarChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
