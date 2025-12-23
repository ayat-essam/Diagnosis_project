import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/reusable_widgets/bar_chart_widget.dart';
import '../../../Core/reusable_widgets/line_chart_widget.dart';
import 'Widgets/grid_view_dashboard_container.dart';
import 'Widgets/patient_dash_board_appbar.dart';
import 'Widgets/slider_bar.dart';

class PatientDashboard extends StatelessWidget {
  const PatientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: const PationDashBoardAppbar(),
      ),
          drawer: const SliderBar(),
   
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22.h),
            const GridViewDashboardContainer(),
            SizedBox(height: 27.h),
            Text('Medication Progress Overview',
                style: StyleApp.font16BlackRegular),
            SizedBox(height: 6.h),
            Text('Last 6 Months',
                style:
                    StyleApp.font16BlackRegular.copyWith(color: Colors.grey)),
            SizedBox(height: 12.h),
            const LineChartWidget(lineBarsData: [],),
            SizedBox(height: 24.h),
            Text('Symptom & Condition Patterns',
                style: StyleApp.font16BlackRegular),
            SizedBox(height: 6.h),
            Text('Current Week',
                style:
                    StyleApp.font16BlackRegular.copyWith(color: Colors.grey)),
            const SizedBox(height: 12),
            const BarChartWidget(barGroups: [],),
          ],
        ),
      ),
    );
  }
}
