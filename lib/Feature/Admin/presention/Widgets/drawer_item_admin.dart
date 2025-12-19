import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Core/Theme App/styleApp.dart';
import '../../../../Core/Theme App/colors.dart';

class DrawerItemAdmin extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isActive;
  final VoidCallback onTap;

  const DrawerItemAdmin({
    super.key,
    required this.iconPath,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.BluePrimary.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        leading: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.BluePrimary
                : Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: buildIcon(),
        ),
        title: Text(
          title,
          style: isActive
              ? StyleApp.font16WhiteMedium.copyWith(
            color: AppColors.BluePrimary,
            fontWeight: FontWeight.w600,
          )
              : StyleApp.font16WhiteMedium.copyWith(
            color: Colors.grey[700],
          ),
        ),
        trailing: isActive
            ? Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.BluePrimary,
            shape: BoxShape.circle,
          ),
        )
            : null,
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget buildIcon() {
    iconPath.toLowerCase().endsWith('.svg') ;
    return SvgPicture.asset(
      iconPath,
      colorFilter: ColorFilter.mode(
        isActive ? Colors.white : Colors.grey[600]!,
        BlendMode.srcIn,
      ),
      width: 24,
      height: 24,
    );
  }

}
