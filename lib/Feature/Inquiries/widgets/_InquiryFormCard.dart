// ---------------- Inquiry Form ----------------
import 'package:diagnosis_project/Feature/Directory/presentation/screens/Directory_%20Screen.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/PrimaryButton.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/SectionTitle.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/dialogCard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/cubit/create_inquiry_cubit.dart';
import '../data/cubit/create_inquiry_state.dart';
import '../data/models/create_inquiry_request.dart';
import 'dart:io';

class InquiryFormCard extends StatelessWidget {
  const InquiryFormCard();

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Submit inquiries'),
          const SizedBox(height: 12),
          const _LabeledField(
            label: 'Symptom ',
            hintfeild: "e.g. pain, swelling, stiffness",
          ),
          const SizedBox(height: 12),
          const _LabeledField(
            label: 'Description',
            hintfeild:
                "Describe when it started, how severe it is, and what makes it better or worse",
            maxLines: 4,
          ),
          const SizedBox(height: 12),
          const Text(
            "Attachments (Optional)",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          const AttachmentBox(),
          const SizedBox(height: 16),
          PrimaryButton(
              text: 'Select doctor',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DirectoryScreen(),
                    ));
              }),
        ],
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final int maxLines;
  final String hintfeild;
  const _LabeledField({
    required this.label,
    required this.hintfeild,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: "*",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintfeild,
            hintStyle: TextStyle(color: Color(0xff7E7E7E), fontSize: 13),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xff207EFF)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xff207EFF)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xff207EFF)),
            ),
          ),
        ),
      ],
    );
  }
}

class AttachmentBox extends StatelessWidget {
  const AttachmentBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const SizedBox(
        width: 324,
        height: 30,
        child: DottedBorder(
          options: RectDottedBorderOptions(
            dashPattern: [15, 5],
            strokeWidth: 2,
            padding: EdgeInsets.all(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.file_upload_outlined, color: Colors.grey),
              Text('Upload medical files'),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWrapper extends StatelessWidget {
  final Widget child;
  const CardWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xff207EFF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
