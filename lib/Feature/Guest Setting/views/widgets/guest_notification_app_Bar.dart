import 'package:flutter/material.dart';

guestNotificationAppBar(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff4682FA),
        Color(0xff3060BE),
      ],
    )),
    height: 120,
    child: AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: const Text(
        'Notifications',
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),
      ),
    ),
  );
}
