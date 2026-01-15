import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/prescription_entity.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/cubit/treatment_plan/treatment_plan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Senttreatmentbutton extends StatelessWidget {
  final String doctorName;
  final String duration;
  final String overview;
  final List<PrescriptionEntity> medications;
  final String hydration;
  final String restrictions;

  Senttreatmentbutton({
    required this.doctorName,
    required this.duration,
    required this.overview,
    required this.medications,
    required this.hydration,
    required this.restrictions,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        text: "Send to patient",
        onPressed: () {
          context.read<TreatmentCubit>();
        },
        width: 100.w,
        height: 35.h,
        backgroundColor: Color(0xff4682FA),
        textColor: Colors.white);
  }
}
