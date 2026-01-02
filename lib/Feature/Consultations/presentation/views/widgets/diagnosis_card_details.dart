import 'package:flutter/material.dart';

class DiagnosisCardDetails extends StatelessWidget {
  const DiagnosisCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xffF7F7F7),
        height: 85,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nada\nAlaa",
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
                const SizedBox(width: 10),
                Text(
                  "AI",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Fever, cough, and\n shortness of breath \nfor 2 days. Recent \n travel.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff4A5565),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Fever, cough, and\n shortness of breath \nfor 2 days. Recent \n travel.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff4A5565),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                customButton(),
                Text(
                  "AM 10:30 2025/12/5",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff4A5565),
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
