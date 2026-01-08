import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, ErrorModel errorMessage) {
  Navigator.pop(context);
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(Icons.error, color: Colors.red, size: 32),
      content: Text(
        errorMessage.getAllErrorMessages(),
        style: StyleApp.font16BlackRegular,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Got it',
            style: StyleApp.font16BlackRegular,
          ),
        ),
      ],
    ),
  );
}
