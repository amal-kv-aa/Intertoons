import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme{
static ThemeData theme = ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: const Color.fromARGB(255, 31, 16, 88),

        textTheme:  TextTheme(
          displayMedium: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp,color: Colors.black
          ),
          labelLarge:  TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,color: Colors.black38
          
          ),
          displayLarge:TextStyle(fontWeight: FontWeight.w800,fontSize: 17.sp,color: Colors.black
          
          ) ,
        )
      );
}