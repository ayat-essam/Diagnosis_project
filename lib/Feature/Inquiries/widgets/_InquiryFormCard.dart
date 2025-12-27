// ---------------- Inquiry Form ----------------
import 'package:diagnosis_project/Feature/Inquiries/widgets/PrimaryButton.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/SectionTitle.dart';
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
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  List<File> selectedFiles = [];

  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle('Submit inquiries'),
          SizedBox(height: 12),
          _LabeledField(
            label: 'Inquire title *',
            controller: titleController,
          ),
          SizedBox(height: 12),
          _LabeledField(
            label: 'Category *',
            controller: categoryController,
          ),
          SizedBox(height: 12),
          _LabeledField(
            label: 'Description',
            controller: descriptionController,
            maxLines: 4,
          ),
          SizedBox(height: 12),
          Text("Attachments (Optional)",
              style: const TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 12),
          AttachmentBox(),
          SizedBox(height: 16),
          BlocConsumer<CreateInquiryCubit, CreateInquiryState>(
            listener: (context, state) {
              if (state is CreateInquirySuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
                print(state.message);
                titleController.clear();
                descriptionController.clear();
                categoryController.clear();
              }

              if (state is CreateInquiryError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return PrimaryButton(
                text: state is CreateInquiryLoading ? 'Sending...' : 'Send',
                onPressed: state is CreateInquiryLoading
                    ? null
                    : () {
                        final request = CreateInquiryRequest(
                          patientId: 1,
                          doctorId: 2,
                          symptoms: titleController.text,
                          notes: descriptionController.text,
                          files: selectedFiles,
                        );

                        context
                            .read<CreateInquiryCubit>()
                            .submitInquiry(request);
                        print(request);
                      },
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
  final TextEditingController controller;

  const _LabeledField({
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xff207EFF)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xff207EFF)),
            ),
          ),
        ),
      ],
    );
  }
}

class AttachmentBox extends StatelessWidget {
  const AttachmentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateInquiryCubit, CreateInquiryState>(
      builder: (context, state) {
        final cubit = context.read<CreateInquiryCubit>();

        List<File> files = [];
        if (state is CreateInquiryFilesSelected) {
          files = state.files;
        }

        return InkWell(
          onTap: () async {
            final result = await FilePicker.platform.pickFiles(
              allowMultiple: true,
              type: FileType.custom,
              allowedExtensions: ['jpg', 'png', 'pdf'],
            );

            if (result != null) {
              final selectedFiles = result.paths
                  .where((e) => e != null)
                  .map((e) => File(e!))
                  .toList();

              cubit.setFiles(selectedFiles);
            }
          },
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: files.isEmpty
                  ? const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.upload_file, color: Colors.grey),
                        SizedBox(height: 4),
                        Text('Add files (Image or PDF)'),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.attach_file, color: Colors.green),
                        const SizedBox(height: 4),
                        Text('${files.length} file(s) selected'),
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
