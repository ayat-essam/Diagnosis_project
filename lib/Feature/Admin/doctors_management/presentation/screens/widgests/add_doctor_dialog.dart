import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/account_step.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/details_step.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/info_step.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/step_indicator.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AddDoctorDialog extends StatefulWidget {
  const AddDoctorDialog({super.key});

  @override
  State<AddDoctorDialog> createState() => _AddDoctorDialogState();
}

class _AddDoctorDialogState extends State<AddDoctorDialog> {
  int _currentStep = 0;

  void _nextPage() {
    if (_currentStep < 2) {
      setState(() => _currentStep++);
    }
  }

  void _previousPage() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.greyLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add doctor", style: StyleApp.font18GrayDarkBold),
              Gap(20.h),
              StepIndicator(currentStep: _currentStep),
              Gap(20.h),
              _getCurrentStepWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCurrentStepWidget() {
    switch (_currentStep) {
      case 0:
        return InfoStep(
          onNext: _nextPage,
          onCancel: () => Navigator.pop(context),
        );
      case 1:
        return AccountStep(
          onNext: _nextPage,
          onBack: _previousPage,
        );
      case 2:
        return DetailsStep(
          onSave: () {},
          onCancel: () => Navigator.pop(context),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
