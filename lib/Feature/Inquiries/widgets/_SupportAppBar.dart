
// ---------------- AppBar ----------------
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SupportAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        'Good morning Ahmed',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12.sp),
      ),
      leading: const Icon(Icons.menu, color: Colors.black),
      actions: [
        _NotificationIcon(count: 5),
        SizedBox(width: 12),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: Colors.grey,
          child: Image.asset("assets/image/profile.png"),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NotificationIcon extends StatelessWidget {
  final int count;
  const _NotificationIcon({required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(Icons.notifications_none, color: Color(0xff4A5565), size: 20.sp),
        if (count > 0)
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.blue,
              child: Text(
                '$count',
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
