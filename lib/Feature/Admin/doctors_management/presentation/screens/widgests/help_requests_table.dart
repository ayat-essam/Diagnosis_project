import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/reply_button.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/stauts_new_or_replied.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/custom_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../data/models/help_request_model.dart';

class HelpRequestsTable extends StatelessWidget {
  final List<HelpRequestModel> requests;

  const HelpRequestsTable({super.key, required this.requests});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = StyleApp.font10gray74Regular;

    return CustomTable(
      columnTitles: const [
        'Name',
        'Experience',
        'Gender',
        'Subject',
        'Status',
      ],
      rows: requests.map((doctor) {
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
            DataCell(SizedBox(
                width: 80.w,
                child: Text(
                  doctor.subject,
                  style: textStyle,
                ))),
            DataCell(
              Row(
                children: [
                  StautsNewOrReplied(
                    status: doctor.status,
                  ),
                  Gap(10.w),
                  const ReplyButton(),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
