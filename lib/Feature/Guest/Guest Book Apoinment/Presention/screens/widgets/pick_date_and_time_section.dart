import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Guest/Guest%20Book%20Apoinment/Presention/screens/widgets/time_slots_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'date_slots_widget.dart';

class PickDateTimeSection extends StatelessWidget {
  const PickDateTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pick Date & Time", style: StyleApp.font20BlackSemiBold),
        SizedBox(
          height: 20.h,
        ),
        const DateSlotsWidget(),
        SizedBox(
          height: 15.h,
        ),
        //time slot
        const TimeSlotsWidget(),
      ],
    );
  }
}
