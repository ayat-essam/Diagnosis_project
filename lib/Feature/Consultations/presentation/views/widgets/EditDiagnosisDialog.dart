import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/CustomTextFormField.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/button.dart';
import 'package:flutter/material.dart';

class EditDiagnosisDialog extends StatelessWidget {
  const EditDiagnosisDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffF7F7F7),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.BluePrimary),
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Modify Diagnosis',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff505050),
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 23),

              /// Name
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff6B6B6B),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const CustomTextFormFieldDialog(
                initialValue: 'COVID-19',
              ),

              const SizedBox(height: 25),

              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff6B6B6B),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),

              CustomTextFormFieldDialog(
                maxLines: 4,
                initialValue:
                    'A contagious respiratory illness caused by the SARS-CoV-2 virus.',
              ),

              const SizedBox(height: 25),

              const Text(
                'Notes',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff6B6B6B),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),

              const CustomTextFormFieldDialog(
                maxLines: 2,
                initialValue: '',
              ),

              const SizedBox(height: 20),

              const Row(
                children: [
                  Expanded(
                    child: Button(
                      'Save',
                      color: AppColors.BluePrimary,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Button(
                      'Cancel',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
