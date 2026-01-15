import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/reply_to_doctor_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReplyButton extends StatelessWidget {
  const ReplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => const ReplyToDoctorDialog());
      },
      icon: const Icon(Icons.reply, size: 16),
      label: const Text("Reply"),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.only(right: 6.w, left: 4, bottom: 2, top: 2),
        minimumSize: Size.zero,
        foregroundColor: AppColors.gray74,
        side: const BorderSide(
          color: AppColors.gray74,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
    );
  }
}
