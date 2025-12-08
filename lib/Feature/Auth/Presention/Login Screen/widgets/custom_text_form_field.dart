import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/Theme App/colors.dart';


class CustomTextFormField extends StatelessWidget {
  String? hint;

  VoidCallback? onTap;
  Function(String)? onChanged;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  Color? borderColor;
  Widget? suffixIcon;
  Color? TextColor;
  CustomTextFormField({
    this.borderColor,
    this.suffixIcon,
    this.TextColor,
    super.key,
    this.hint,
    this.onTap,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.validator, required bool filled,  required bool obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
       hoverColor: AppColors.gray,
        hintStyle: TextStyle(
          color: AppColors.BluePrimary
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.BluePrimary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        hintText: hint,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.RedError,
          ),
        ),
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.RedError,
          ),
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.BluePrimary,
          ),
        ),
      ),
      style:StyleApp.font15GrayRegular.copyWith(color: AppColors.BluePrimary),
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: AppColors.BluePrimary,
      maxLines: 1,
      cursorErrorColor: AppColors.RedError,
      cursorWidth: 3,
      showCursor: true,
    );
  }
}
