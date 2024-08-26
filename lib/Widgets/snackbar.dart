import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubham_practical/Core/app_color.dart';

void snackBar(String title, {Color? color}) {
  final snackBar = SnackBar(
    content: Text(title,
        style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold)),
    backgroundColor: color ?? AppColor.goldColor,
  );
  ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
}
