import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlotsWidget extends StatefulWidget {
  const TimeSlotsWidget({
    super.key,
  });

  @override
  State<TimeSlotsWidget> createState() => _TimeSlotsWidgetState();
}

class _TimeSlotsWidgetState extends State<TimeSlotsWidget> {
  int selectedTime = 1;
  final List<String> times = ["9:30 am", "10:00 am", "11:00 am", "03:00 pm"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: times.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedTime == index;
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.BluePrimary
                    : AppColors.whiteBackground,
                borderRadius: BorderRadius.circular(12),
                border: const Border.fromBorderSide(
                  BorderSide(color: AppColors.BluePrimary),
                ),
              ),
              child: Text(
                times[index],
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected
                      ? AppColors.whiteBackground
                      : AppColors.BluePrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
