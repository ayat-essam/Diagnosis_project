import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/help_request_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/help_requests_table.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/get_patients_bloc_builder.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/patient_management_header.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/patient_management_tabs.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/patients_management_search_section.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/slider_bar_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/reusable_widgets/custom_app_bar_widget.dart';

class PatientsMangementScreen extends StatefulWidget {
  const PatientsMangementScreen({super.key});

  @override
  State<PatientsMangementScreen> createState() => _PatientsMangementScreenState();
}

class _PatientsMangementScreenState extends State<PatientsMangementScreen> {
  bool isPatientSelected = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PatientsMangementCubit>()..getpatients(),
      child: Scaffold(
        backgroundColor: AppColors.whiteBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: const CustomAppBarWidget(),
        ),
        drawer: const SliderBarAdmin(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PatientManagementHeader(),
                Gap(20.h),
                PatientManagementTabs(
                  isPatientSelected: isPatientSelected,
                  onTabChanged: (value) {
                    setState(() {
                      isPatientSelected = value;
                    });
                  },
                ),
                Gap(10.h),
                const PatientsManagementSearchSection(),
                Gap(20.h),
                isPatientSelected
                    ? const GetPatientsBlocBuilder()
                    : HelpRequestsTable(
                        requests: HelpRequestModel.fakeRequests),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
