import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/guest_setting_view.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/widgets/guest_notifi_item.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/widgets/guest_app_Bar.dart';
import 'package:diagnosis_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class GuestNotificationView extends StatelessWidget {
  const GuestNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteBackground,
        body: Column(
          children: [
            guestAppBar(context, S.of(context).notifications),
            const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 27,
                      ),
                      const SettingText(
                        text: "Today",
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const NotificationGuestItem(),
                      const SizedBox(
                        height: 16,
                      ),
                      const NotificationGuestItem(),
                      const SizedBox(
                        height: 32,
                      ),
                      const SettingText(
                        text: "Yesterday",
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const NotificationGuestItem(),
                      const SizedBox(
                        height: 16,
                      ),
                      const NotificationGuestItem(),
                    ])),
          ],
        ));
  }
}
