import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'doctor_dash_board_container_model.dart';
import 'info_conatiner_doctor_dash_board.dart';

class RowDoctorDashBoardContainer extends StatelessWidget {
  final int totalConsultations;
  final int totalTreatmentPlans;

  const RowDoctorDashBoardContainer({
    super.key,
    required this.totalConsultations,
    required this.totalTreatmentPlans,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InfoConatinerDoctorDashBoard(
            doctorDashBoardContainerModel: DoctorDashBoardContainerModel(
              title: 'Consultations',
              imagePath: 'assets/image/consultations.png',
              value: totalConsultations.toString(),
              onTap: () {},
            ),
          ),
        ),
        Gap(16.w),
        Expanded(
          child: InfoConatinerDoctorDashBoard(
            doctorDashBoardContainerModel: DoctorDashBoardContainerModel(
              title: 'Treatment plans',
              imagePath: 'assets/image/Treatment plans.png',
              value: totalTreatmentPlans.toString(),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
