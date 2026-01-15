import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMedicationCard(String medicationName, String dosage) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: SizedBox(
      width: double.infinity,
      height: 80.h,
      child: CustomLinearGradiantContainer(
        child: ListTile(
          leading: Text(dosage),
          title: Text(medicationName),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
    ),
  );
}
