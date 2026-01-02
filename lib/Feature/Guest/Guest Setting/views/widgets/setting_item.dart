import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.image,
    required this.title,
    this.trailing,
    this.size,
    this.onPressed,
    this.decoration,
  });

  final String image, title;
  final IconData? trailing;
  final double? size;
  final void Function()? onPressed;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: decoration ??
            BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
        child: ListTile(
          leading: Image.asset(image),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff1E2640),
              fontFamily: 'Poppins',
            ),
          ),
          trailing: IconButton(
              onPressed: onPressed,
              icon: Icon(trailing ?? Icons.arrow_forward_ios,
                  size: size ?? 25, color: const Color(0xff1E2640))),
        ));
  }
}
