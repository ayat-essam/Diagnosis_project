import 'package:diagnosis_project/Feature/Inquiries/widgets/PrimaryButton.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_InquiryFormCard.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/gradinetCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

Future<void> submitDialog(BuildContext context) {
  final formatted = DateFormat(' MMMM d, y').format(DateTime.now());
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Knee pain after running",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xff505050),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xff9ec6ff),
              ),
              child: const Row(
                children: [
                  Icon(Icons.check, color: Color(0xff207EFF)),
                  Text(
                    "Replied",
                    style: TextStyle(fontSize: 8, color: Color(0xff207EFF)),
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
              const Text(
                "# TKT-2024-1156",
                style: TextStyle(fontSize: 13, color: Color(0xff565656C2)),
              ),
              Row(
                children: [
                  const Icon(Icons.date_range, color: Color(0xff565656C2)),
                  Text(
                    formatted,
                    style: const TextStyle(
                        fontSize: 13, color: Color(0xff565656C2)),
                  ),
                ],
              ),
              const Text(
                "Description",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              gradientCard(
                child: Column(
                  children: [
                    const Text(
                      "Ongoing wrist pain with occasional swelling and limited movement, affecting daily activities.",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3562BC),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40, right: 60),
                      child: Text(
                        formatted,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff565656C2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text("Attachment"),
              AttachmentBox(),
              const Text("Doctor Reply"),
              gradientCard(
                child: Column(
                  children: [
                    const Text(
                      "Your symptoms may be related to inflammation or strain in the wrist. Try to rest the hand and avoid activities that worsen the pain. An in-clinic examination is needed to confirm the diagnosis and decide the proper treatment.",
                    ),
                    Text(
                      formatted,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xff565656C2),
                      ),
                    ),
                  ],
                ),
              ),
              const Text("Doctor plan or prescription"),
              AttachmentBox(),
              SizedBox(height: 20.h),
              PrimaryButton(text: "OK", onPressed: () {}),
            ],
          ),
        ),
      );
    },
  );
}
