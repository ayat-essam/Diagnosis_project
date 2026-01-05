import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class SwitchIcon extends StatefulWidget {
  const SwitchIcon({super.key});

  @override
  State<SwitchIcon> createState() => _SwitchIconState();
}

class _SwitchIconState extends State<SwitchIcon> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isOn,
      onChanged: (value) {
        setState(() {
          isOn = value;
        });
      },
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
