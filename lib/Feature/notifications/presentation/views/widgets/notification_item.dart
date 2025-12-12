import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/notifications/data/model/noitification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.noitificationModel,
  });
  final NoitificationModel noitificationModel;
  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [
        Color(0xff207EFF),
        Color(0xffC6D8FD),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(1.7),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
          decoration: BoxDecoration(
            color: const Color(0xffF7F7F7),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              SvgPicture.asset(noitificationModel.image1),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      noitificationModel.title,
                      style: StyleApp.font20BlackMedium,
                    ),
                    Text(noitificationModel.subtitle,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.blackSecondary,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SvgPicture.asset(noitificationModel.image2!),
            ],
          )),
    );
  }
}
