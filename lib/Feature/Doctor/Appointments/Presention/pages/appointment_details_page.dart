import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointments_app_bar.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_elevated_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/details_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key, required this.patient});
  final Map<String, dynamic> patient;

  @override
  Widget build(BuildContext context) {
    Color getStatusColor(String status) {
      switch (status) {
        case "Follow-up":
          return Colors.green;
        case "New patient":
          return AppColors.orange;
        case "Urgent":
          return AppColors.RedError;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: const AppointmentsAppBar(
        title: "Patient Details",
        isSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/image/person.png", scale: 3.5),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patient['name'],
                      style: StyleApp.font18BlackSemiBold,
                    ),
                    Text(
                      "${patient['age']} Years",
                      style: StyleApp.font16graySecondaryRegular,
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  child: Text(
                    patient['status'],
                    style: StyleApp.font12WhiteSemiBold,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: getStatusColor(patient['status'])),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                  margin: EdgeInsets.only(bottom: 11.h),
                )
              ],
            ),
            const SizedBox(height: 20),
            const DetailsRow(
              title: "December 2, 2025",
              icon: Icons.calendar_today,
            ),
            SizedBox(height: 10.h),
            DetailsRow(title: patient['time'], icon: Icons.access_time),
            SizedBox(height: 10.h),
            const DetailsRow(
                title: "Chest Pain Check", icon: Icons.info_outline),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  style: StyleApp.font12WhiteSemiBold,
                  color: Colors.blue,
                  title: "View details",
                ),
                CustomElevatedButton(
                  style: StyleApp.font12BlackSemiBold,
                  color: AppColors.grayE2,
                  title: "Add Notes",
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CustomElevatedButton(
              style: StyleApp.font12RedErrorSemiBold,
              color: AppColors.grayE2,
              title: "Cancel",
              padding: 80.w,
            ),
          ],
        ),
      ),
    );
  }
}
