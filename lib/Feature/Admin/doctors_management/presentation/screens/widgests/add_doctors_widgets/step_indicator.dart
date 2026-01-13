import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/add_doctors_widgets/dash_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class CircleItem extends StatelessWidget {
  const CircleItem({super.key, required this.index, required this.isActive});

  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15.r,
      backgroundColor: isActive ? Colors.blue : AppColors.stepIndicatorGrey,
      child: Text(
        "${index + 1}",
        style: StyleApp.font16WhiteSemiBold,
      ),
    );
  }
}
