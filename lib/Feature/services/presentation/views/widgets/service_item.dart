import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Color(0xffE5E7EB))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Image.asset('assets/image/medical_reports.png'),
          title: Text(
            'Online Diagnosis',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.blackSecondary),
          ),
          subtitle: Text(
            'Get instant online medical assessment anytime.',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 9.sp,
                color: AppColors.blackSecondary),
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              size: 25, color: Color(0xff231F20)),
        ),
      ),
    );
  }
}
