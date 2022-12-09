import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Show {
  static toast(
      {required BuildContext context,
      required String text,
      Color? color,
      double? fontSize,
      Color? textColor}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          text,
          style: TextStyle(
              color: textColor ?? Colors.white, fontSize: fontSize ?? 14.sp),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: color ?? const Color.fromARGB(255, 197, 2, 86)));
  }
}
