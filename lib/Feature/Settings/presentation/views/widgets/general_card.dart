import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/general_dropdown.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  const GeneralCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/image/general.png',
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "General ",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff505050),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
            "Language",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff6B6B6B),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const GeneralDropdown(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    ));
  }
}
