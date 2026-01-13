import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'method_card.dart';

class FrequencyCard extends StatelessWidget {
  const FrequencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              backgroundColor: Color(0xffBACCEE),
              radius: 20.r,
              child: Icon(Icons.list, color: Color(0xff4C84F7))),
          Spacer(),
          Text(
            'Frequency',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text('Once every 3 weeks'),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.medical_services,
                size: 32, color: Color(0xff4C84F7)),
          ),
        ],
      ),
    );
  }
}
