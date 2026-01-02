import 'package:flutter/material.dart';

class CustomTextFormFieldDialog extends StatelessWidget {
  const CustomTextFormFieldDialog(
      {super.key, required this.initialValue, this.maxLines = 1});
  final String initialValue;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff6B6B6B),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
