import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:gap/gap.dart';
import '../../../data/models/doctor_model.dart';
import 'status_badge.dart';
import 'reply_button.dart';

class DoctorRow extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorRow({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(doctor.image), radius: 15),
                Gap(10.w),
                Flexible(
                    child: Text(
                  doctor.name,
                  style: StyleApp.font10gray74Regular,
                )),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Text(
                doctor.experience,
                style: StyleApp.font10gray74Regular,
              )),
          Expanded(
              flex: 3,
              child: Text(
                doctor.gender,
                style: StyleApp.font10gray74Regular,
              )),
          Gap(10.w),
          Expanded(
              flex: 2,
              child: Text(
                doctor.subject,
                maxLines: 2,
                style: StyleApp.font10gray74Regular,
              )),
          Gap(10.w),
          Expanded(
              flex: 4,
              child: StatusBadge(
                status: doctor.status,
              )),
          Gap(10.w),
          const ReplyButton(),
        ],
      ),
    );
  }
}
