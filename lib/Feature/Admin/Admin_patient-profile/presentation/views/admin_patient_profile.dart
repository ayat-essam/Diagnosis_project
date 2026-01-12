import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/get_patient_profile_bloc_builder.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/BackToPatientTablebutton.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/custom_appBar_Consultations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPatientProfile extends StatelessWidget {
  const AdminPatientProfile({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PatientsMangementCubit>()..getPatientProfile(id),
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
                      "Patient Profile ",
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
                  "View patients accounts and  \n diagnosis history ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Color(0xff747474)),
                ),
                SizedBox(
                  height: 14,
                ),
                GetPatientProfileBlocBuilder(),
              ],
            ),
          )
        ]))),
      ),
    );
  }
}