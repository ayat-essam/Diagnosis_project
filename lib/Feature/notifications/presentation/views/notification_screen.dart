import 'package:diagnosis_project/Feature/notifications/presentation/views/widgets/custom_appBar.dart';
import 'package:diagnosis_project/Feature/notifications/presentation/views/widgets/notifications_list_view.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65), child: const CustomAppBar()),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 3,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
                child: Text('Notification Screen',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackSecondary))),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: NotificationsListView(),
            )
          ],
        ),
      )),
    );
  }
}
