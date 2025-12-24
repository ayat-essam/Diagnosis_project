import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../data/models/doctor_model.dart';
import 'doctor_row.dart';

class DoctorsTable extends StatelessWidget {
  final List<DoctorModel> doctors;
  const DoctorsTable({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          _buildHeader(),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: doctors.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) => DoctorRow(doctor: doctors[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    TextStyle textStyle = StyleApp.font9grayTextChart
                      .copyWith(fontWeight: FontWeight.bold);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[50]!,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text("Name",
                  style: textStyle)),
          Expanded(
              flex: 4,
              child: Text("Experience",
                  style:textStyle)),
          Expanded(
              flex: 3,
              child: Text("Gender",
                  style: textStyle)),
          Expanded(
              flex: 3,
              child: Text("Subject",
                  style: textStyle)),
          Expanded(
              flex: 4,
              child: Text("Status",
                  style: textStyle)),
          Gap(60.w), // مساحة لزر الرد
        ],
      ),
    );
  }
}
