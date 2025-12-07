import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewPastAppointmentsButton extends StatelessWidget {
  const ViewPastAppointmentsButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h, top: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blue,
            ),
            Center(
              child: Text(
                'View past appointments',
                style: StyleApp.font13BlueRegular.copyWith(fontSize: 14.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
