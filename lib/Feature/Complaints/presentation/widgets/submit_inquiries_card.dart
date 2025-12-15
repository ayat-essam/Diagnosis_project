import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Theme App/colors.dart';
import 'custom_input_field.dart';
import 'custom_dropdown_field.dart';
import 'required_label.dart';

class SubmitInquiriesCard extends StatelessWidget {
  final File? selectedFile;
  final VoidCallback pickFile;

  const SubmitInquiriesCard({
    super.key,
    required this.selectedFile,
    required this.pickFile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.dateSloteColor,
            AppColors.BluePrimary,
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.grayF2,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Submit Inquiries",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: const Color(0xFF252525),
                ),
              ),
              SizedBox(height: 10.h),
              const RequiredLabel(text: "Complaints title"),
              SizedBox(height: 6.h),
              const CustomInputField(),
              SizedBox(height: 12.h),
              const RequiredLabel(text: "Category"),
              SizedBox(height: 6.h),
              CustomDropdownField(
                value: "Appointments",
                items: const ["Appointments", "Complaints"],
                onChanged: (value) {},
              ),
              SizedBox(height: 12.h),
              const RequiredLabel(text: "Description"),
              SizedBox(height: 6.h),
              const CustomInputField(maxLines: 4),
              SizedBox(height: 12.h),
              Text(
                "Attachments (Optional)",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  height: 1,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 6.h),
              GestureDetector(
                onTap: pickFile,
                child: Container(
                  width: double.infinity,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.graySecondary),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.upload_file, size: 20),
                        const SizedBox(width: 8),
                        Text(selectedFile == null
                            ? "Add files (Image or PDF)"
                            : selectedFile!.path.split('/').last),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: SizedBox(
                  width: 228.w,
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.BluePrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Send",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        height: 1,
                        color: AppColors.whiteBackground,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
