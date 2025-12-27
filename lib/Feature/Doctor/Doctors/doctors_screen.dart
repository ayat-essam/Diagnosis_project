import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Core/Theme App/colors.dart';
import 'widgets/custom_bottom_nav.dart';
import 'widgets/doctor_card.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.2),
        // shadowColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset('assets/image/logo.png'),
            SizedBox(width: 80.w),
            Stack(clipBehavior: Clip.none, children: [
              Icon(Icons.notifications, size: 24.sp, color: Color(0xff231F20)),
              Positioned(
                bottom: 14,
                left: 15,
                child: Container(
                  width: 15.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: AppColors.BluePrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      '5',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              //SvgPicture.asset('assets/image_SVG/notification.svg'),
            ]),
            SizedBox(width: 10.w),
            CircleAvatar(
              radius: 18.r,
              backgroundImage: AssetImage('assets/image/profile.png'),
            ),
            SizedBox(width: 14.w),
          ]),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 14.w,
              ),
              Icon(Icons.arrow_back_ios, size: 25.sp, color: Color(0xff231F20)),
              SizedBox(width: 20.w),
              Text(
                "Doctors",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff252525),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return DoctorCard(
                  name: "Dr. Jelen Kaya",
                  specialty: "Dermatologist",
                  experience: "10",
                  nextAvailable: "Today, 3:00 PM",
                  rating: "4.9",
                  reviews: "270",
                  image: "assets/image/doctor_profile.png",
                  onBook: () {},
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 2,
        onTap: (index) {
          // setState(() => currentIndex = index);
        },
      ),
    );
  }
}
