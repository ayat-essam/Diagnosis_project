import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/DiagnosisCardDetails.dart';
import 'package:flutter/material.dart';

class DiagnosiscarddetailslIst extends StatelessWidget {
  const DiagnosiscarddetailslIst({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: DiagnosisCardDetails(),
          );
        });
  }
}
