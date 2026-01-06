import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/cubit/user_settings_cubit.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/cubit/user_settings_state.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/switch_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSettingsCubit, UserSettingsState>(
      builder: (context, state) {
        final cubit = context.read<UserSettingsCubit>();
        return GradientBorder(
          child: Container(
            padding: const EdgeInsets.only(top: 14, left: 23),
            decoration: BoxDecoration(
              color: const Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/image_SVG/notification.svg',
                      color: AppColors.BluePrimary,
                      height: 27,
                      width: 20,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff505050),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),

                /// Email Notifications
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 0, right: 8),
                  title: Text(
                    "Email Notifications",
                    style: StyleApp.font14BlueSemiBold
                        .copyWith(color: AppColors.gray6B),
                  ),
                  subtitle: Text(
                    "Receive notifications via email",
                    style: StyleApp.font12WhiteMedium
                        .copyWith(color: AppColors.gray6B),
                  ),
                  trailing: SwitchIcon(
                    value: state.receiveEmailNotifications,
                    onChanged: (value) {
                      cubit.changeReceiveEmailNotifications(value);
                    },
                  ),
                ),

                Divider(color: Colors.grey[300]),

                ListTile(
                  contentPadding: const EdgeInsets.only(left: 0, right: 8),
                  title: Text(
                    "SMS Notifications",
                    style: StyleApp.font14BlueSemiBold
                        .copyWith(color: AppColors.gray6B),
                  ),
                  subtitle: Text(
                    "Receive notifications via SMS",
                    style: StyleApp.font12WhiteMedium
                        .copyWith(color: AppColors.gray6B),
                  ),
                  trailing: SwitchIcon(
                    value: false,
                    onChanged: (_) {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
