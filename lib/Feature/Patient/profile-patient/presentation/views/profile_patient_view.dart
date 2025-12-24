import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/custom_appBar_Consultations.dart';
import 'package:diagnosis_project/Feature/Patient/profile-patient/presentation/views/widgets/current-treatment-plan-card.dart';
import 'package:diagnosis_project/Feature/Patient/profile-patient/presentation/views/widgets/follow-up-notes-card.dart';
import 'package:diagnosis_project/Feature/Patient/profile-patient/presentation/views/widgets/medical_records_card.dart';
import 'package:diagnosis_project/Feature/Patient/profile-patient/presentation/views/widgets/profile_card.dart';
import 'package:diagnosis_project/Feature/Patient/profile-patient/presentation/views/widgets/x_ray_media_section.dart';
import 'package:flutter/material.dart';

class ProfilePatientView extends StatelessWidget {
  const ProfilePatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: CustomAppBarConsultations()),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
        Container(
          height: 3,
          color: Colors.grey[300],
        ),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 27,
                ),
                Text(
                  "Patient Profile ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: Color(0xff252525)),
                ),
                SizedBox(
                  height: 22,
                ),
                PatientInfoCard(),
                SizedBox(
                  height: 17,
                ),
                MedicalRecordsCard(),
                SizedBox(
                  height: 17,
                ),
                XRayMediaSection(),
                SizedBox(
                  height: 17,
                ),
                CurrentTreatmentPlanCard(),
                SizedBox(
                  height: 17,
                ),
                FollowUpNotesCard()
              ],
            ))
      ]))),
    );
  }
}
