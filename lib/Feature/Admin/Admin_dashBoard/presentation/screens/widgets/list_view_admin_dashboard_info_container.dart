import 'package:diagnosis_project/Feature/Admin/Admin_dashBoard/data/models/info_admin_dash_board_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_dashBoard/presentation/screens/widgets/admin_dashboard_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/admin_dashboard_entity.dart';

class ListViewAdminDashboardInfoContainer extends StatefulWidget {
  final AdminDashboardEntity data;

  const ListViewAdminDashboardInfoContainer({
    super.key,
    required this.data,
  });

  @override
  State<ListViewAdminDashboardInfoContainer> createState() =>
      _ListViewAdminDashboardInfoContainerState();
}

class _ListViewAdminDashboardInfoContainerState
    extends State<ListViewAdminDashboardInfoContainer> {
      
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    List<InfoAdminDashBoardModel> infoCards = [
       InfoAdminDashBoardModel(
        title: 'Total Doctors',
        subtitle: data.totalDoctors.toString(),
        description: data.totalDoctorsChange,
        imgPath: 'assets/image_SVG/doctorBagIcon.svg',
      ),
      InfoAdminDashBoardModel(
        title: 'Active Doctors',
        subtitle: data.activeDoctors.toString(),
        description: data.activeDoctorsChange,
        imgPath: 'assets/image_SVG/active_doctors.svg',
      ),
      InfoAdminDashBoardModel(
        title: 'Total Patients',
        subtitle: data.totalPatients.toString(),
        description: data.totalPatientsChange,
        imgPath: 'assets/image_SVG/total_patient.svg',
      ),
      InfoAdminDashBoardModel(
        title: 'Peak Usage Time',
        subtitle: data.peakUsageTime,
        description: 'Highest system activity window',
        imgPath: 'assets/image_SVG/peak_useage_time.svg',
      ),
      InfoAdminDashBoardModel(
        title: 'Ai Diagnosis',
        subtitle: '2,123',
        description: '↑ 8% vs last months',
        imgPath: 'assets/image_SVG/aiMessage.svg',
      ),
      InfoAdminDashBoardModel(
        title: 'Doctor Diagnosis',
        subtitle: '1,687',
        description: '↑ 7% vs last months',
        imgPath: 'assets/image_SVG/doctor_diagnosis.svg',
      ),
    ];

    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: infoCards.length,
        itemBuilder: (context, index) {
          final card = infoCards[index];

          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: AdminDashboardInfoContainer(
                infoAdminDashBoardModel: card,
                isSelected: selectedIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
