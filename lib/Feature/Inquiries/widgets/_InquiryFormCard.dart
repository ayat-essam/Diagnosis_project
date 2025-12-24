
// ---------------- Inquiry Form ----------------
import 'package:diagnosis_project/Feature/Inquiries/widgets/PrimaryButton.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/SectionTitle.dart';
import 'package:flutter/material.dart';

class InquiryFormCard extends StatelessWidget {
  const InquiryFormCard();

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle('Submit inquiries'),
          SizedBox(height: 12),
          _LabeledField(label: 'Inquire title *'),
          SizedBox(height: 12),
          _LabeledField(label: 'Category *'),
          SizedBox(height: 12),
          _LabeledField(label: 'Description', maxLines: 4),
          SizedBox(height: 12),
          Text("Attachments (Optional)",
              style: const TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 12),
          _AttachmentBox(),
          SizedBox(height: 16),
          PrimaryButton(text: 'Send'),
        ],
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final int maxLines;

  const _LabeledField({required this.label, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
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

class _AttachmentBox extends StatelessWidget {
  const _AttachmentBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.upload_file, color: Colors.grey),
            SizedBox(height: 4),
            Text('Add files (Image or PDF)'),
          ],
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