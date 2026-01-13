import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DosageCard extends StatelessWidget {
  const DosageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff4C84F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/icons/Frame.png",
                width: 200.w,
              )),
          Spacer(),
          Text(
            'Dosage',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 4),
          Text(
            '160 mg/m2',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/icons/Vector (1).png",
              height: 40.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
