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
        image1: 'assets/image_SVG/Medical Notifications1.svg',
        image2: 'assets/image_SVG/Medical Notifications2.svg',
        isCompleted: false),
    NoitificationModel(
        title: 'Physiotherapy Alerts',
        subtitle: ' Reminders for your exercises and sessions',
        image1: 'assets/image_SVG/Physiotherapy Alerts1.svg',
        image2: 'assets/image_SVG/Physiotherapy Alerts2.svg',
        isCompleted: false),
    NoitificationModel(
        title: 'Medical Notifications',
        subtitle: ' New lab re sults and medical reports',
        image1: 'assets/image_SVG/Medical Notifications1.svg',
        image2: 'assets/image_SVG/Medical Notifications2.svg',
        isCompleted: false),
    NoitificationModel(
        title: 'Appointments Alerts',
        subtitle: 'Reminders and confirmations of upcoming appointmentss',
        image1: 'assets/image_SVG/Appointments Alerts1.svg.svg',
        image2: 'assets/image_SVG/Appointments Alerts2.svg',
        isCompleted: false),
    NoitificationModel(
        title: 'Doctors Responses',
        subtitle: ' Replies to your inquiries and messagess',
        image1: 'assets/image_SVG/DoctorsResponses.svg',
        image2: 'assets/image_SVG/Medical Notifications2.svg',
        isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationItem(
          noitificationModel: notifications[index],
        );
      },
    );
  }
}
