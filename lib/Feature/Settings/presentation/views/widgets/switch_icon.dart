import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class SwitchIcon extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  
  const SwitchIcon({
    super.key,
    required this.value,
    required this.onChanged,
    
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged:  onChanged,
      thumbColor: WidgetStateProperty.all(Colors.white),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      activeColor: Colors.white,
      activeTrackColor: AppColors.BluePrimary,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey.shade300,
    );
  }
}
