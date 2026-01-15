import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/prescription_entity.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/cubit/prescription/prescription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitPrescriptionSection extends StatelessWidget {
  final TextEditingController dosageController;
  final TextEditingController durationController;
  final TextEditingController frequencyController;
  final TextEditingController instructionsController;
  final TextEditingController notesController;
  final int patientId;

  const SubmitPrescriptionSection({
    super.key,
    required this.dosageController,
    required this.durationController,
    required this.frequencyController,
    required this.instructionsController,
    required this.notesController,
    required this.patientId,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Send to patient",
      onPressed: () {
        context.read<AddPrescriptionCubit>().submit(
              PrescriptionEntity(
                medicationName: "Fastum",
                dosage: dosageController.text,
                duration: durationController.text,
                frequency: frequencyController.text,
                instructions: instructionsController.text,
                notes:
                    notesController.text.isEmpty ? null : notesController.text,
              ),
              patientId,
            );
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => TreatmentPlanScreen()));
      },
      backgroundColor: const Color(0xff4682FA),
      width: 12.w,
      textColor: Colors.white,
      height: 37.h,
    );
  }
}
