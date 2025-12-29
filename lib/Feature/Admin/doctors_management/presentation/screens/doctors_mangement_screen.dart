import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/doctor_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/request_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/doctor_management_header.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/doctor_management_search_section.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/doctor_management_tabs.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/doctors_table.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/help_requests_table.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/slider_bar_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../DashBoard Patient/presention/Widgets/patient_dash_board_appbar.dart';

class DoctorsMangementScreen extends StatefulWidget {
  const DoctorsMangementScreen({super.key});

  @override
  State<DoctorsMangementScreen> createState() => _DoctorsMangementScreenState();
}

class _DoctorsMangementScreenState extends State<DoctorsMangementScreen> {
  bool isDoctorSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const PationDashBoardAppbar(),
      ),
      drawer: const SliderBarAdmin(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DoctorManagementHeader(),
              Gap(20.h),
              DoctorManagementTabs(
                isDoctorSelected: isDoctorSelected,
                onTabChanged: (value) {
                  setState(() {
                    isDoctorSelected = value;
                  });
                },
              ),
              Gap(10.h),
              const DoctorManagementSearchSection(),
              Gap(20.h),
              isDoctorSelected
                  ? DoctorsTable(doctors: DoctorModel.faleDoctors)
                  : HelpRequestsTable(requests: RequestModel.fakeRequests),
            ],
          ),
        ),
      ),
    );
  }
}
