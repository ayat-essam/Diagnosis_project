import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../data/models/doctor_dash_board_container_model.dart';
import 'custom_linear_gradiant_circle.dart';

class InfoConatinerDoctorDashBoard extends StatelessWidget {
  const InfoConatinerDoctorDashBoard(
      {super.key, required this.doctorDashBoardContainerModel});
  final DoctorDashBoardContainerModel doctorDashBoardContainerModel;
  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: SizedBox(
        width: 190.w,
        height: 155.h,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomLinearGradiantCircle(
                    image: doctorDashBoardContainerModel.imagePath,
                  ),
                ],
              ),
              Text(doctorDashBoardContainerModel.title,
                  style: StyleApp.font18BlackSemiBold),
              Gap(4.h),
              Text(doctorDashBoardContainerModel.value,
                  style: StyleApp.font24BlackBold),
              Gap(4.h),
              CustomAppButton(
                onTap: () {},
                text: 'View',
                width: 140.w,
                borderRedius: 25.r,
              )
            ],
          ),
        ),
      ),
    );
  }
}
