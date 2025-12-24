import 'package:diagnosis_project/Feature/SuggestedTreatment/presentation/view/widgets/method_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Theme App/colors.dart';
import 'widgets/diagnosis_module_card.dart';
import 'widgets/manual_symptoms_entry_card.dart';
import 'widgets/upload_card.dart';

class DiagnosisModuleScreen extends StatelessWidget {
  const DiagnosisModuleScreen({super.key});

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
              Icon(Icons.menu, size: 24.sp, color: Color(0xff231F20)),
              Image.asset('assets/image/logo.png'),
              SizedBox(width: 80.w),
              Stack(clipBehavior: Clip.none, children: [
                Icon(Icons.notifications,
                    size: 24.sp, color: Color(0xff231F20)),
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 11),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child:  Text(
                  'Diagnosis Module',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff505050)
                  ),
                ),
              ),
              WhiteCard(child: DiagnosisModuleCard()),
              SizedBox(height: 16),
              WhiteCard(child: ManualSymptomsCard()),
              WhiteCard(child: UploadingCard()),
              SizedBox(
                height: 70.h,
              ),
            ],
          ),
        ));
  }
}
