import 'package:flutter/material.dart';

class DrugAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
      title: Image.asset("assets/image/logo2.png", height: 30),
      actions: [
        NotificationIcon(
          count: 5,
        ),
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/patient.jpg'),
        ),
      ],
    );
  }
}

class NotificationIcon extends StatelessWidget {
  int count = 0;
  NotificationIcon({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined, color: Colors.black),
        ),
        if (count > 0)
          Positioned(
              child: Center(
            child: CircleAvatar(
              child: Text(count.toString()),
            ),
          ))
      ],
    );
  }
}
