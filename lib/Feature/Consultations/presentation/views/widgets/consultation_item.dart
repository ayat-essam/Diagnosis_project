import 'package:flutter/material.dart';

class ConsultationItem extends StatelessWidget {
  const ConsultationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xff6B6B6B))),
      child: Row(children: [
        const Column(
          children: [
            Text(
              'Chest X-ray.jpg',
              style: TextStyle(
                  color: Color(0xff6B6B6B),
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Date: 2025-08-02',
              style: TextStyle(
                  color: Color(0xff9A9999),
                  fontWeight: FontWeight.w500,
                  fontSize: 10),
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Image.asset('assets/image/view.png'),
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/image/download.png'),
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/image/Delete.png'),
          ],
        ),
      ]),
    );
  }
}
