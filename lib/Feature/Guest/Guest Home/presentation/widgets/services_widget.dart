import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../Core/Theme App/colors.dart';
import '../../data/services_dummy_data.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        separatorBuilder: (_, __) => Gap(12.w),
        itemBuilder: (context, index) {
          final service = services[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.dateSloteColor,
                  AppColors.BluePrimary,
                ],
              ),
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
              width: 200.w,
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: AppColors.whiteBackground,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(8),
                      Expanded(
                        child: Text(service.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              color: AppColors.blackSecondary,
                            )),
                      ),
                      const Gap(6),
                      const CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.grayF2,
                        child: Icon(
                          Icons.lock,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(service.subtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 11,
                          color: AppColors.graySecondary)),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.BluePrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Login to use',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.whiteBackground,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
