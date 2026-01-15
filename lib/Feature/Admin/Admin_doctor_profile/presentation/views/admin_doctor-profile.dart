import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_doctor_profile/presentation/views/widgets/get_doctor_profile_bloc_builder.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/BackToPatientTablebutton.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/custom_appBar_Consultations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorProfile extends StatelessWidget {
  const AdminDoctorProfile({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DoctorsManagementCubit>()..getDoctorProfile(id),
      child: Scaffold(
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
                  "View Doctors accounts and  \n diagnosis history ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Color(0xff747474)),
                ),
                SizedBox(
                  height: 14,
                ),                
                GetDoctorProfileBlocBuilder(),
              ],
            ),
          )
        ]))),
      ),
    );
  }
}
