
import 'package:diagnosis_project/Feature/Inquiries/widgets/PrimaryButton.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_InquiryFormCard.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/gradinetCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> dialogProgress(BuildContext context) {
  final formatted = DateFormat(' MMMM d, y').format(DateTime.now());
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Knee pain after running",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xff505050),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF3D39C),
              ),

              child: Row(
                children: [
                  Image.asset("assets/images/group.png", width: 20),
                  Text(
                    "In progress",
                    style: TextStyle(
                      color: Color(0xffA97007),
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "# TKT-2024-1156",
                style: TextStyle(fontSize: 13, color: Color(0xff565656C2)),
              ),
              Row(
                children: [
                  Icon(Icons.date_range, color: Color(0xff565656C2)),
                  Text(
                    formatted,
                    style: TextStyle(fontSize: 13, color: Color(0xff565656C2)),
                  ),
                ],
              ),
          const     Text(
                "Description",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              gradientCard(
                child: Column(
                  children: [
                    Text(
                      "Pain after running\n Description: I booked an appointment \nfor tomorrow, but didn’t receive a confirmation\n message. Can you confirm if it’s scheduled?",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3562BC),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Attachments"),
              AttachmentBox(),
              PrimaryButton(text: "OK", onPressed: () {}),
            ],
          ),
        ),
      );
    },
  );
}
