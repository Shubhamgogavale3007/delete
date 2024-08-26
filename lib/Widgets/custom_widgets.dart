import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubham_practical/Core/app_color.dart';

class CustomWidgets {
  static customTextField(String hintText,
          {bool? obscureText,
          Widget? suffixIcon,
          TextInputAction? textInputAction,
          TextEditingController? controller,
          int? minLines,
          int? maxLines,
          String? Function(String?)? validator}) =>
      TextFormField(
          minLines: minLines ?? 1,
          maxLines: maxLines ?? 1,
          validator: validator,
          controller: controller,
          obscureText: obscureText ?? false,
          autofocus: true,
          style:
              GoogleFonts.poppins(color: AppColor.goldColor, fontSize: 16.sp),
          cursorColor: AppColor.goldColor,
          textInputAction: textInputAction,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.goldColor),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.goldColor),
                  borderRadius: BorderRadius.circular(10)),
              errorMaxLines: 5,
              errorStyle: GoogleFonts.poppins(
                  color: AppColor.redColor, fontSize: 14.sp),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.redColor),
                  borderRadius: BorderRadius.circular(10)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.redColor),
                  borderRadius: BorderRadius.circular(10))));
}
