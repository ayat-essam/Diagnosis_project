import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/cupertino.dart';

class HeaderCell extends StatelessWidget {
  final String text;
  final int flex;

  const HeaderCell({
    required this.text,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style:  StyleApp.font12WhiteRegular.copyWith(color: AppColors.black)
      ),
    );
  }
}