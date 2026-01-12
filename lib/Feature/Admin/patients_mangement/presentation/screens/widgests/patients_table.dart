import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/action_patient_dialog.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/status_active_or_inactive.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/custom_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class PatientsTable extends StatelessWidget {
  final List<PatientEntity> patients;

  const PatientsTable({super.key, required this.patients});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = StyleApp.font10gray74Regular;

    return CustomTable(
      columnTitles: const [
        'PatientName',
        //'age',
        'Gender',
        'Diagnoses',
        'Last Diagnoses',
        'Status',
        'Actions'
      ],
      rows: patients.map((patient) {
        return DataRow(
          cells: [
            DataCell(Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage("assets/image/profile.png"),
                    radius: 15),
                Gap(10.w),
                SizedBox(
                  width: 45.w,
                  child: Text(patient.fullName, style: textStyle),
                ),
              ],
            )),
            DataCell(Text(patient.gender, style: textStyle)),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/image/diabetes_follow_up.png',
                  color: AppColors.gray74,
                  height: 20.h,
                  width: 20.w,
                ),
                Gap(5.w),
                Text(
                  patient.diagnosesCount.toString(),
                  style: textStyle,
                ),
              ],
            )),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/image/apoinments.png',
                  color: AppColors.gray74,
                  height: 20.h,
                  width: 20.w,
                ),
                Text(
                  patient.lastDiagnosisDate == null
                      ? '-'
                      : DateFormat('MMM dd, yyyy')
                          .format(DateTime.parse(patient.lastDiagnosisDate!)),
                  style: textStyle,
                ),
              ],
            )),
            DataCell(StatusActiveOrInactive(status: patient.status)),
            DataCell(IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => ActionPatientDialog(id: patient.id));
              },
              icon: const Icon(
                Icons.more_vert,
              ),
            )),
          ],
        );
      }).toList(),
    );
  }
}
