import 'package:diagnosis_project/Feature/Guest%20Setting/views/guest_notification_view.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/widgets/setting_item.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/widgets/show_language_bottom_sheet.dart';
import 'package:diagnosis_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          SettingItem(
            decoration: const BoxDecoration(),
            image: 'assets/image/notif.png',
            title: S.of(context).notifications,
            size: 16,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GuestNotificationView()),
              );
            },
          ),
          SettingItem(
            decoration: const BoxDecoration(),
            trailing: Icons.keyboard_arrow_down,
            image: 'assets/image/general.png',
            title: S.of(context).language,
            onPressed: () {
              showLanguageBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }
}
