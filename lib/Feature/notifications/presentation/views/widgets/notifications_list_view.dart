import 'package:diagnosis_project/Feature/notifications/data/model/noitification_model.dart';
import 'package:diagnosis_project/Feature/notifications/presentation/views/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationsListView extends StatelessWidget {
  NotificationsListView({
    super.key,
  });
  final List<NoitificationModel> notifications = [
    NoitificationModel(
        title: 'Medical Notifications',
        subtitle: ' New lab results and medical reports',
        image1: 'assets/image SVG/Medical_Notifications1.svg',
        image2: 'assets/image SVG/Medical_Notifications2.svg',
        isCompleted: false),
    NoitificationModel(
        title: 'Physiotherapy Alerts',
        subtitle: ' Reminders for your exercises and sessions',
        image1: 'assets/image SVG/Physiotherapy_Alerts1.svg',
        image2: 'assets/image SVG/PhysiotherapyAlerts2.svg',
        isCompleted: false),
    NoitificationModel(
        title: 'Appointments Alerts',
        subtitle: 'Reminders and confirmations of upcoming appointmentss',
        image1: 'assets/image SVG/Appointments_Alerts1.svg',
        image2: 'assets/image SVG/Appointments_Alerts2.svg',
        isCompleted: false),
    NoitificationModel(
        title: 'Doctors Responses',
        subtitle: ' Replies to your inquiries and messagess',
        image1: 'assets/image SVG/DoctorsResponses.svg',
        isCompleted: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: NotificationItem(
            noitificationModel: notifications[index],
          ),
        );
      },
    );
  }
}
