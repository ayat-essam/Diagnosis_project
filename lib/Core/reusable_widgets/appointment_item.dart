import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem(
      {super.key,
      required this.rowOnTap,
      required this.moreIconOnTap,
      required this.color, required this.name, required this.hintText, required this.image});
  final VoidCallback rowOnTap;
  final VoidCallback moreIconOnTap;
  final String name;
  final String hintText;
  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
      child: InkWell(
        highlightColor: Colors.white,
        onTap: rowOnTap,
        child: Row(
          children: [
            // Colored Dot
            Image.asset(image, scale: 4),

            const SizedBox(width: 16),

            // Appointment Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        StyleApp.font18BlackSemiBold.copyWith(fontSize: 14.sp)),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text(
                      hintText,
                      style: StyleApp.font14graySecondaryRegular,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Icon(
                      Icons.circle,
                      size: 10.r,
                      color: color,
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            InkWell(
                onTap: moreIconOnTap,
                borderRadius: BorderRadius.circular(22),
                child: const Icon(
                  Icons.more_vert,
                  size: 35,
                  color: AppColors.graySecondary,
                ))
            // IconButton(onPressed: () {
            //
            // }, icon: Icon(Icons.more_vert))
          ],
        ),
      ),
    );
  }
}
// {appointments['age']} years
//{appointments['name']}