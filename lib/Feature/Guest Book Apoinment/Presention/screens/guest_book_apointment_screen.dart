import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Feature/Guest%20Book%20Apoinment/Presention/screens/widgets/book_apoinment_appbar.dart';
import 'package:diagnosis_project/Feature/Guest%20Book%20Apoinment/Presention/screens/widgets/enter_information_section.dart';
import 'package:diagnosis_project/Feature/Guest%20Book%20Apoinment/Presention/screens/widgets/pick_date_and_time_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestBookApointmentScreen extends StatelessWidget {
  const GuestBookApointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: const BookApointmentAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/image/arrow_back.png",
                    color: AppColors.black,
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Book Apointment",
                    style: StyleApp.font25blackbold,
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              const EnterInformationSection(),
              SizedBox(
                height: 20.h,
              ),
              const PickDateTimeSection(),
              SizedBox(
                height: 29.h,
              ),
              CustomAppButton(
                onTap: () {},
                text: 'Book Now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
