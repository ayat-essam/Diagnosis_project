import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Theme App/colors.dart';


class TrackStatusCard extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  final String ticketNumber;
  final String date;
  final String issueType;
  final VoidCallback onViewDetails;

  const TrackStatusCard({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.ticketNumber,
    required this.date,
    required this.issueType,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.dateSloteColor,
            AppColors.BluePrimary,
          ],
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.grayF2,
          borderRadius: BorderRadius.circular(11.r),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.sp,
                      height: 1,
                      letterSpacing: 0,
                      color: AppColors.blackSecondary,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                        color: statusColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.tag_outlined,
                  size: 14,
                  color: AppColors.graySecondary,
                ),
                SizedBox(width: 5.w),
                Text(
                  ticketNumber,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColors.graySecondary,
                  ),
                ),
                SizedBox(width: 12.w),
                const Icon(
                  Icons.calendar_month,
                  size: 14,
                  color: AppColors.graySecondary,
                ),
                SizedBox(width: 5.w),
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColors.graySecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                const Icon(Icons.calendar_month_sharp,
                    color: AppColors.RedError, size: 16),
                SizedBox(width: 5.w),
                Text(
                  issueType,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColors.blackSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              height: 21.h,
              child: ElevatedButton(
                onPressed: onViewDetails,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.BluePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text("View details",
                    style: TextStyle(
                        color: AppColors.whiteBackground,
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
