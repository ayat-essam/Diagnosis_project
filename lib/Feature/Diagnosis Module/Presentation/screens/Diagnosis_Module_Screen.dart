import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_doctor_app_bar.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/clinical_findings_section.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/diagnosis_assistant_section.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/diagnosis_details_section.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/grid_view_diagnosis_templet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DiagnosisModuleScreen extends StatelessWidget {
  const DiagnosisModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: CustomScrollView(
        slivers: [
          /// App Bar
          const SliverToBoxAdapter(
            child: CustomDoctorAppBar(),
          ),

          /// Content
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Medical Diagnosis Dashboard",
                      style: StyleApp.font20BlackMedium,
                    ),
                  ),
                  Gap(10.h),
                  const DiagnosisAssistantSection(),
                  Gap(15.h),
                  Text(
                    "Diagnosis Details",
                    style: StyleApp.font20BlackMedium,
                  ),
                  Text(
                    "Type 2 Diabetes Mellitus",
                    style: StyleApp.font14graySecondaryRegular,
                  ),
                  Gap(5.h),
                  const DiagnosisDetailsSection(),
                  Gap(10.h),
                  const ClinicalFindingsSection(),
                  Gap(16.h),
                  Text(
                    "Diagnosis Templates",
                    style: StyleApp.font20BlackMedium,
                  ),
                ],
              ),
            ),
          ),
          const GridViewDiagnosisTemplet(),
        ],
      ),
    );
  }
}
