import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shubham_practical/Core/app_color.dart';

class Utils {
  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(
            AppColor.goldColor,
          ),
        ),
      ),
      barrierDismissible: isCancellable,
    );
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    Get.back();
  }

  static Widget mainLoader() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                height: 30.h,
                width: 30.w,
                child: (Platform.isAndroid)
                    ? const CircularProgressIndicator(
                        color: AppColor.goldColor, strokeWidth: 2)
                    : const CupertinoActivityIndicator(
                        color: AppColor.blackColor))));
  }
}
