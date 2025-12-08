import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AppointmentsAppBar({super.key,  this.title,  this.onSearchPressed,  this.textField,  this.isSearch =true});
  final String? title;
  final Widget? textField;
  final bool isSearch;
  final VoidCallback? onSearchPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 52.h,
      title:textField?? Text(
          title!,
          style: StyleApp.font18BlackSemiBold,
        ),
      // isSearch?  Text(
      //   title,
      //   style: StyleApp.font18BlackSemiBold,
      // ):textField,
      // actionsPadding: EdgeInsets.only(right: 20.w),
      actions: [
        if (isSearch==true)
          IconButton(
          onPressed: onSearchPressed,
          icon: const Icon(Icons.search),
          color: AppColors.BluePrimary,
        )
      ],
      leading: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => Navigator.pop(context),
        child: Image.asset(
          "assets/icons/Path.png",
          scale: 4,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(52.h);
}
