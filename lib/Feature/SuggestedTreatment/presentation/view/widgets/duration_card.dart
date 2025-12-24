import 'package:flutter/material.dart';

import 'method_card.dart';

class DurationCard extends StatelessWidget {
  const DurationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.timer, color: Color(0xff4C84F7)),
          const Spacer(),
          const Text(
            'Total Duration',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          const Text('Once every 3 weeks'),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xffD6E4FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Completed',
                style: TextStyle(
                  color: Color(0xff4C84F7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
