import 'package:diagnosis_project/Feature/Diagnosis%20Module/widgets/upload_item.dart';
import 'package:flutter/material.dart';

class UploadingCard extends StatelessWidget {
  const UploadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            children: const [
              Icon(Icons.refresh_rounded, size: 18),
              SizedBox(width: 8),
              Text(
                'Uploading',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                '1 item failed to upload',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// Files
          const UploadItem(showRetry: false),
          const UploadItem(showRetry: true),
          const UploadItem(showRetry: false),
          const UploadItem(showRetry: false),
        ],
      );
  }
}
