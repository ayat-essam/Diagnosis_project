import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class StatusDropdown extends StatefulWidget {
  const StatusDropdown({super.key});

  @override
  State<StatusDropdown> createState() => _StatusDropdownState();
}

class _StatusDropdownState extends State<StatusDropdown> {
  String selectedValue = 'All statuses';

  final List<String> items = [
    'All statuses',
    'Active',
    'Inactive',
    'Pending',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.BluePrimary),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Row(
                children: [
                  Text(
                    item,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B)),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
