import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MethodCard extends StatelessWidget {
  const MethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffBACCEE),
            child: Image.asset("assets/icons/Frame (1).png", width: 200.w),
          ),
          const Spacer(),
          const Text(
            'Method',
            style: TextStyle(
                color: Color(0xff505050), fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  value: 0.3,
                  minHeight: 6,
                  backgroundColor: Colors.grey.shade300,
                  color: const Color(0xff4C84F7),
                ),
              ),
              const SizedBox(width: 8),
              const Text('3 hours'),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/icons/Vector.png",
                width: 200.w,
                height: 100.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteCard extends StatelessWidget {
  final Widget child;

  const WhiteCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xffC6D8FD).withOpacity(0.7),
            const Color(0xff207EFF).withOpacity(0.9),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: child,
      ),
    );
  }
}
