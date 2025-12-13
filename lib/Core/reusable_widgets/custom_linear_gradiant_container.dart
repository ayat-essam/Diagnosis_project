import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/cupertino.dart';

class CustomLinearGradiantContainer extends StatelessWidget {
  const CustomLinearGradiantContainer(
      {super.key, required this.child, this.color = AppColors.greyLight});
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                AppColors.BluePrimary,
                AppColors.BluePrimary.withAlpha(70)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  color,
                  color,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
          child: child,
        ));
  }
}
