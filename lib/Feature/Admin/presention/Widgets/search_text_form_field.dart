import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
    this.onChanged,
    required this.hintText,
  });
  final void Function(String)? onChanged;
  final String hintText ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 38.h,
      color: AppColors.greyLight,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.gray7A)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.gray74)),
          hintText: hintText,
          hintStyle:
              StyleApp.font12BlueRegular.copyWith(color: AppColors.gray7A),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 6.w, right: 4.w),
            child: Image.asset(
              'assets/image/Search.png',
              width: 16.w,
              height: 16.h,
              color: AppColors.gray74,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 8.w,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 16.w,
            minHeight: 24.h,
          ),
        ),
      ),
    );
  }
}
