import 'package:flutter/material.dart';

class NotificationGuestItem extends StatelessWidget {
  const NotificationGuestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, 0), // shadow من كل الاتجاهات
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              const Text(
                'New message',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              Text(
                '08:23 AM',
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff404444),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s.',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      color: Colors.grey,
                      height: 1.4,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Image.asset('assets/image/back_notifi.png')
            ],
          )
        ],
      ),
    );
  }
}
