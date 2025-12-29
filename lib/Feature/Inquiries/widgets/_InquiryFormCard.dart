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

class InquiryFormCard extends StatefulWidget {
  const InquiryFormCard();

  @override
  State<InquiryFormCard> createState() => _InquiryFormCardState();
}

class _InquiryFormCardState extends State<InquiryFormCard> {
  late TextEditingController symptomController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    symptomController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    symptomController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Submit inquiries'),
          const SizedBox(height: 12),
          _LabeledField(
            label: 'Symptom',
            hintfeild: "e.g. pain, swelling, stiffness",
            controller: symptomController,
            onChange: (value) {
              context.read<CreateInquiryCubit>().setSymptoms(value);
            },
          ),
          const SizedBox(height: 12),
          _LabeledField(
              label: 'Description',
              hintfeild:
                  "Describe when it started, how severe it is, and what makes it better or worse",
              maxLines: 4,
              controller: descriptionController,
              onChange: (value) {
                context.read<CreateInquiryCubit>().setDescription(value);
              }),
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
                  builder: (_) => BlocProvider.value(
                    value: context.read<CreateInquiryCubit>(),
                    child: const DirectoryScreen(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final int maxLines;
  final String hintfeild;
  final TextEditingController controller;
  final ValueChanged<String> onChange;

  const _LabeledField(
      {required this.label,
      required this.hintfeild,
      this.maxLines = 1,
      required this.controller,
      required this.onChange});

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
          controller: controller,
          onChanged: onChange,
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
  const AttachmentBox({super.key});

  Future<void> _pickFiles(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );

    if (result != null) {
      final files = result.paths.map((path) => File(path!)).toList();

      context.read<CreateInquiryCubit>().setFiles(files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateInquiryCubit, CreateInquiryState>(
      builder: (context, state) {
        int filesCount = 0;

        if (state is CreateInquiryFilesSelected) {
          filesCount = state.files.length;
        }

        return GestureDetector(
          onTap: () => _pickFiles(context),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DottedBorder(
              options: const RectDottedBorderOptions(
                dashPattern: [15, 5],
                strokeWidth: 2,
                padding: EdgeInsets.all(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.file_upload_outlined, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    filesCount == 0
                        ? 'Upload medical files'
                        : '$filesCount file(s) selected',
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
