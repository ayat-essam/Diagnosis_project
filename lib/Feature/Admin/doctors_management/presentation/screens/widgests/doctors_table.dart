import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_entity.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/action_dialog.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/status_active_or_inactive.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/custom_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class DoctorsTable extends StatelessWidget {
  final List<DoctorEntity> doctors;

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
                const CircleAvatar(
                    backgroundImage: AssetImage("assets/image/profile.png"),
                    radius: 15),
                Gap(10.w),
                SizedBox(
                  width: 45.w,
                  child: Text(doctor.fullName, style: textStyle),
                ),
              ],
            )),
            DataCell(Text(doctor.experienceYears.toString(), style: textStyle)),
            DataCell(Text(doctor.gender ?? "Male", style: textStyle)),
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
                  doctor.lastConsultationDate == null
                      ? '-'
                      : DateFormat('MMM dd, yyyy')
                          .format(DateTime.parse(doctor.lastConsultationDate!)),
                  style: textStyle,
                ),
              ],
            )),
            DataCell(StatusActiveOrInactive(status: doctor.status)),
            DataCell(IconButton(
              onPressed: () {
                // Capture the cubit from the current context
                final doctorCubit = context.read<DoctorsManagementCubit>();

                showDialog(
                  context: context,
                  builder: (context) => BlocProvider.value(
                      value: doctorCubit, // Provide the existing cubit instance
                      child: ActionDialog(doctorEntity: doctor)),
                );
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
