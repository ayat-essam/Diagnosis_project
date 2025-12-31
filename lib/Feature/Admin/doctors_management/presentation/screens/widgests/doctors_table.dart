import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/doctor_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/action_dialog.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/status_active_or_inactive.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/custom_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DoctorsTable extends StatelessWidget {
  final List<DoctorModel> doctors;

  const DoctorsTable({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = StyleApp.font10gray74Regular;

    return CustomTable(
      columnTitles: const [
        'Name',
        'Experience',
        'Gender',
        'Consultation',
        'Last Consultation',
        'Status',
        'Action'
      ],
      rows: doctors.map((doctor) {
        return DataRow(
          cells: [
            DataCell(Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(doctor.image), radius: 15),
                Gap(10.w),
                SizedBox(
                  width: 45.w,
                  child: Text(doctor.name, style: textStyle),
                ),
              ],
            )),
            DataCell(Text(doctor.experience, style: textStyle)),
            DataCell(Text(doctor.gender, style: textStyle)),
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
                  doctor.consultationsCount.toString(),
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
                  doctor.lastConsultationDate,
                  style: textStyle,
                ),
              ],
            )),
            DataCell(StatusActiveOrInactive(status: doctor.status)),
            DataCell(IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const ActionDialog());
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
