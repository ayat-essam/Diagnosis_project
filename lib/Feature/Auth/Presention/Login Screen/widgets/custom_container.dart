import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  double? width;
  double? height;
  Color? color;
  Color? borderColor;
  double? borderWidth;
  BorderStyle? borderStyle;
  BorderRadius? borderRadius;
  DecorationImage? decorationImage;
  EdgeInsets? padding;
  EdgeInsets? margin;
  Widget? child;

  CustomContainer({
    this.child,
    Key? key,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.borderStyle,
    this.borderRadius,
    this.decorationImage,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
          style: borderStyle ?? BorderStyle.none,
        ),
        borderRadius: borderRadius,
        image: decorationImage,
        shape: BoxShape.rectangle,
      ),
      padding: padding,
      margin: margin,
      child: child,
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
    );
  }
}
