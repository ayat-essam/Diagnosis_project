import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/circle_item.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/dash_line.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        bool isActive = index <= currentStep;
        if (index == 2) {
          return CircleItem(index: index, isActive: isActive);
        }
        return Expanded(
          child: Row(
            children: [
              CircleItem(index: index, isActive: isActive),
              Expanded(
                child: DashedLine(
                  color: index < currentStep
                      ? AppColors.BluePrimary
                      : AppColors.stepIndicatorGrey,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}