import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class CustomConsultationSearch extends StatelessWidget {
  const CustomConsultationSearch({super.key, this.controller, this.onChanged});
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFFFFFF),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.BluePrimary)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.BluePrimary)),
            hintText: "Search in Consultations ....",
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xffC6C4C4)),
            prefixIcon: Image.asset(
              'assets/image/Search.png',
              color: const Color(0xffC6C4C4),
            )),
      ),
    );
  }
}
