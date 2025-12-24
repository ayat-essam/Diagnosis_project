import 'package:diagnosis_project/Feature/Diagnosis%20Module/widgets/base_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiagnosisModuleCard extends StatelessWidget {
  const DiagnosisModuleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Upload Box
          Column(
            children: [
              CircleAvatar(
                radius: 63.r,
                backgroundColor: Color(0xff4682FA),
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundColor: const Color(0xffEEF3FF),
                  child: Icon(
                    Icons.upload_file,
                    color: Color(0xff4682FA),
                    size: 60.sp,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text('Upload your files here',
                  style: TextStyle(
                      color: Color(0xff505050),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: Color(0xff505050),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: 'Drag and drop your files here, or ',
                    ),
                    TextSpan(
                      text: 'click to browse',
                      style: TextStyle(
                        color: Color(0xff4C84F7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  UploadWidgetBox(
                    text: 'Upload image',
                  ),
                  const SizedBox(width: 12),
                  UploadWidgetBox(
                    text: 'Upload file',
                  ),
                ],
              ),
              const SizedBox(height: 12),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Color(0xff505050),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                      children: [
                    TextSpan(text: 'Supported formats:'),
                    TextSpan(
                      text: " PDF, JPG, PNG, ZIP ",
                      style: TextStyle(
                        color: Color(0xff4C84F7),
                      ),
                    ),
                    TextSpan(text: " Maximum size:"),
                    TextSpan(
                      text: " 10 MB",
                      style: TextStyle(
                        color: Color(0xff4C84F7),
                      ),
                    ),
                  ]))
            ],
          ),
        ],
      ),
    );
  }
}

class UploadWidgetBox extends StatelessWidget {
  UploadWidgetBox({
    super.key,
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Color(0xff4682FA),
            width: 1.5,
          ),
          padding: EdgeInsets.symmetric(horizontal: 1.5, vertical: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        icon: const Icon(
          Icons.image,
          color: Color(0xff4682FA),
        ),
        label: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            bottom: 14,
          ),
          child: Text(
            text,
            style: TextStyle(
                color: Color(0xff4682FA),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
