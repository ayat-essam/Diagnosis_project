import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class DiagnosisCardDetails extends StatelessWidget {
  const DiagnosisCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 152,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0xffF7F7F7),
            borderRadius: BorderRadius.circular(15),
            border: Border.symmetric(
                horizontal: BorderSide(color: AppColors.BluePrimary))),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (BuildContext context, index) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 32),
                        const Text(
                          "Nada \n Alaa",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xff101828),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "27 • F",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "AI",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Fever, cough, and\n shortness of breath \nfor 2 days. Recent \n travel.",
                      style: TextStyle(
                        height: 1.7,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: Color(0xff4A5565),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Fever, cough, and\n shortness of breath \nfor 2 days. Recent \n travel.",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: Color(0xff4A5565),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    customButton(),
                    const SizedBox(width: 20),
                    Text(
                      "AM 10:30 2025/12/5",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: Color(0xff4A5565),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Image.asset('assets/image/view.png'),
                    const SizedBox(
                      width: 8,
                    ),
                    Image.asset('assets/image/Delete.png'),
                  ]);
            }));
  }
}

Widget customButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      "AI",
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: Colors.blue.shade700,
      ),
    ),
  );
}
