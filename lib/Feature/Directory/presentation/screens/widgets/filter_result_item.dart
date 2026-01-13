import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// import '../../../../Guest/Guest Home/Models/doctors_model.dart';
import '../../../../Admin/doctors_management/data/models/doctor_model.dart';
import '../../../../Inquiries/presentation/cubit/create_inquiry_cubit.dart';
import '../../../../Inquiries/presentation/cubit/create_inquiry_state.dart';

class FilterResultItem extends StatelessWidget {
  const FilterResultItem({
    super.key,
    required this.doctor,
  });
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateInquiryCubit, CreateInquiryState>(
        builder: (context, state) {
      final cubit = context.read<CreateInquiryCubit>();
      final isSelected = cubit.doctorId == doctor.id;

      return GestureDetector(
        onTap: () {
          cubit.setDoctorId(doctor.id);
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isSelected ? AppColors.BluePrimary : Colors.transparent,
                width: 2,
              ),
            ),
            child: CustomLinearGradiantContainer(
                borderRadius: 8.r,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 30.0, right: 10, left: 10, top: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28.r,
                        backgroundImage: AssetImage(doctor.image),
                      ),
                      Gap(10.w),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  doctor.name,
                                  style: StyleApp.font10blackSecondryMedium,
                                ),
                                Gap(8.w),
                                Text(
                                  '${doctor.experience} experience',
                                  style: StyleApp.font10blackSecondryMedium,
                                ),
                              ],
                            ),
                            Gap(3.h),
                            Row(
                              children: [
                                Text(
                                  'Physiotherapy',
                                  style: StyleApp.font10blackSecondryMedium
                                      .copyWith(color: AppColors.BluePrimary),
                                ),
                                Gap(3.w),
                                Text('Next Available : Fri, 8:00 PM',
                                    style: StyleApp.font10blackSecondryMedium),
                              ],
                            ),
                            Gap(3.h),
                            Row(
                              children: [
                                Text(
                                  'New York',
                                  style: StyleApp.font10blackSecondryMedium
                                      .copyWith(color: AppColors.gratext),
                                ),
                                Gap(8.w),
                                const Icon(
                                  Icons.star,
                                  color: AppColors.OrangeWarning,
                                  size: 15,
                                ),
                                Gap(2.w),
                                Text(
                                  '4.9',
                                  style: StyleApp.font10blackSecondryMedium
                                      .copyWith(color: AppColors.OrangeWarning),
                                ),
                              ],
                            ),
                          ])
                    ],
                  ),
                )),
          ),
        ),
      );
    });
  }
}
