import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../data/models/doctor_dash_board_container_model.dart';
import 'info_conatiner_doctor_dash_board.dart';

class RowDoctorDashBoardContainer extends StatelessWidget {
  const RowDoctorDashBoardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoConatinerDoctorDashBoard(
            doctorDashBoardContainerModel: DoctorDashBoardContainerModel(
                title: 'Consultations',
                imagePath: 'assets/image/consultations.png',
                value: '2',
                onTap: () {}),
          ),
          Gap(16.w),
          InfoConatinerDoctorDashBoard(
            doctorDashBoardContainerModel: DoctorDashBoardContainerModel(
                title: 'Treatment plans',
                imagePath: 'assets/image/Treatment plans.png',
                value: '12',
                onTap: () {}),
          ),
        ],
      ),
    );
  }
}
