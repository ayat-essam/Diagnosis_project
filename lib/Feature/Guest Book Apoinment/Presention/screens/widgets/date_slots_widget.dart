// <<<<<<< HEAD
// =======
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateSlotsWidget extends StatefulWidget {
  const DateSlotsWidget({super.key});

  @override
  State<DateSlotsWidget> createState() => _DateSlotsWidgetState();
}

class _DateSlotsWidgetState extends State<DateSlotsWidget> {
  int selectedTime = 0;
  final List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  final List<String> dates = ["7", "8", "9", "10", "11", "12", "13"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedTime == index;
          return GestureDetector(
            onTap: () {
              setState(() => selectedTime = index);
            },
            child: Container(
              width: 48.w,
              margin: const EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 1),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.BluePrimary
                    : AppColors.dateSloteColor,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                children: [
                  Text(
                    days[index],
                    style: TextStyle(
                      fontSize: 15,
                      color: isSelected
                          ? AppColors.whiteBackground
                          : AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    dates[index],
                    style: TextStyle(
                      fontSize: 15,
                      color: isSelected
                          ? AppColors.whiteBackground
                          : AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// >>>>>>> Consultations-features
