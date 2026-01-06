import 'package:flutter/material.dart';

Widget gradientCard({required Widget child}) {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(colors: [Color(0xff207EFF), Color(0xffC6D8FD)]),
    ),
    child: Padding(
      padding: EdgeInsets.all(2),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(padding: EdgeInsets.all(12), child: child),
      ),
    ),
  );
}
