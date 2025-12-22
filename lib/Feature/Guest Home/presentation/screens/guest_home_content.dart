import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/doctors_Widget.dart';
import '../widgets/guest_carousel_widget.dart';
import '../../../../Core/reusable_widgets/search_bar_widget.dart';
import '../widgets/services_widget.dart';

class GuestHomeContent extends StatelessWidget {
  const GuestHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SearchBarWidget(hintText: 'Search...',),
            GuestCarouselWidget(),
            const Gap(20),
            const Text("Services",style: TextStyle(
              color: AppColors.blackSecondary,
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            const Gap(12),
            const ServicesWidget(),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Doctors",
                  style: TextStyle(
                    color: AppColors.blackSecondary,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to all doctors screen
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: AppColors.BluePrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.BluePrimary,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(12),
            const DoctorsWidget(),

          ],
        ),
      ),
    );
  }
}
