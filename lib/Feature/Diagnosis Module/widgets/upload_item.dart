import 'package:flutter/material.dart';

import 'circular_percent_indicator.dart';

class UploadItem extends StatelessWidget {
  final bool showRetry;

  const UploadItem({super.key, required this.showRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          /// File icon + size

          Icon(Icons.upload_file, color: Color(0xff4C84F7), size: 28),
          SizedBox(width: 10),
          Text(
            '1,2 MB / 2,9 MB',
            style: TextStyle(color: Color(0XFF505050)),
          ),

          const Spacer(),

          /// Right side
          showRetry
              ? ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.refresh,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Try Again',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4C84F7),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
              : const CircularPercentIndicator(percent: 0.42),
        ],
      ),
    );
  }
}
