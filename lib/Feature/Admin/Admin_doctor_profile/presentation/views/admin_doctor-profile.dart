import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
<<<<<<< HEAD
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
=======
import 'package:diagnosis_project/Feature/Admin/Admin_doctor_profile/presentation/views/widgets/Dashboard_section.dart';
>>>>>>> 7041cd81a13af485f89ac22ff85786d2daf77d4c
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/BackToPatientTablebutton.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/ConsultationHistory.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/PersonalInfoCard.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/patient_image.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/custom_appBar_Consultations.dart';
import 'package:flutter/material.dart';

class AdminDoctorProfile extends StatelessWidget {
  const AdminDoctorProfile({super.key});

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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Doctor Profile ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: Color(0xff252525)),
                ),
                Spacer(),
                BackToPatientTableButton()
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "View patient accounts and  \n diagnosis history ",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: Color(0xff747474)),
            ),
            SizedBox(
              height: 14,
            ),
            PatientImage(),
            SizedBox(
              height: 14,
            ),
            // PersonalInfoCard(),
            SizedBox(
              height: 14,
            ),
            // DashboardSection(),
            SizedBox(
              height: 14,
            ),
            ConsultationHistory(),
            SizedBox(
              height: 14,
            ),
          ]),
        )
      ]))),
    );
  }
}
