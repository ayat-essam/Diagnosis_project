import 'package:flutter/material.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';

class PatientManagementHeader extends StatelessWidget {
  const PatientManagementHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Patient Management",
                style: StyleApp.font25grayDarkMedium,
              ),
              Text(
                "Manage Patients accounts and monitor activity",
                style: StyleApp.font16graySecondaryRegular,
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}
