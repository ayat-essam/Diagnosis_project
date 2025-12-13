import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Core/Theme App/colors.dart';

class PreviousRepliesCard extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  final String ticketNumber;
  final String date;
  final String staffName;
  final String message;
  final VoidCallback onViewFullConversation;

  const PreviousRepliesCard({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.ticketNumber,
    required this.date,
    this.staffName = "Staff",
    required this.message,
    required this.onViewFullConversation,
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
                        color: AppColors.blackSecondary,
                        fontFamily: 'Poppins',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
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
                        fontFamily: 'Poppins',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
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
                const SizedBox(width: 5),
                Text(
                  ticketNumber,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColors.graySecondary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColors.graySecondary,
                  ),
                ),
                const SizedBox(width: 12),
                SvgPicture.asset(
                  'assets/image_SVG/person.svg',
                  width: 14,
                  height: 14,
                  color: AppColors.graySecondary,
                ),
                const SizedBox(width: 5),
                Text(
                  staffName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColors.graySecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF1F3A70)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: AppColors.blackSecondary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                onPressed: onViewFullConversation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.BluePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "View full conversation",
                  style: TextStyle(
                      color: AppColors.whiteBackground,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
