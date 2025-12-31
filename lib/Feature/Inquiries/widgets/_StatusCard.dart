
// ---------------- Shared Widgets ----------------
import 'package:diagnosis_project/Feature/Inquiries/widgets/PrimaryButton.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/StatusBadge.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_InquiryFormCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String status;
  final String? description;
  String textButton;
  final VoidCallback onPressed;
  StatusCard({
    required this.title,
    required this.status,
    this.description,
    required this.textButton,
    required this.onPressed,
  });
  final formatted = DateFormat(' MMMM d, y').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 30.h),
      child: CardWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color(0xff565656),
                    ),
                  ),
                ),
                StatusBadge(text: status),
              ],
            ),
            if (description != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      description!,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff565656C2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                ],
              ),
            ],
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Color(0xff565656C2),
                  size: 16.sp,
                ),
                Text(
                  formatted,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff565656C2),
                  ),
                ),
              ],
            ),
      
            SizedBox(height: 12.h),
            if (title == "Appointment was cancelled without notice")
              Text(
                "Appointment Issue",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xff565656),
                  fontWeight: FontWeight.w500,
                ),
              ),
            if (title == "Long wait time at clinic")
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xffE0F0FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xff1F3A70)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "We appreciate your understanding. As a gesture of goodwill, we'd like to offer you priority scheduling for your next visit.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff565656),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Last reply: Nov 12, 2025 at 10:00 AM",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff878787),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 12),
            PrimaryButton(
              text: textButton,
              onPressed: onPressed,
      
              isOutlined: false,
            ),
          ],
        ),
      ),
    );
  }
}
