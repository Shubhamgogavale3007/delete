import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubham_practical/Core/app_color.dart';
import 'package:shubham_practical/Core/app_string.dart';
import 'package:shubham_practical/Presentations/Login/controller/login_controller.dart';
import 'package:shubham_practical/Widgets/custom_widgets.dart';
import 'package:shubham_practical/Widgets/elevated_button.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.blackColor,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _view(),
          Form(
              key: controller.formKey,
              child: Padding(
                  padding:
                      EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppString.login,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: AppColor.goldColor,
                                fontSize: 40.sp)),
                        SizedBox(height: 30.h),
                        Text(AppString.username,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: AppColor.goldColor,
                                fontSize: 16.sp)),
                        SizedBox(height: 10.h),
                        CustomWidgets.customTextField(validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter UserID';
                          }
                          return null;
                        }, AppString.enterUserID,
                            controller: controller.userNameController,
                            textInputAction: TextInputAction.next),
                        SizedBox(height: 20.h),
                        Text(AppString.password,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: AppColor.goldColor,
                                fontSize: 16.sp)),
                        SizedBox(height: 10.h),
                        Obx(() => CustomWidgets.customTextField(
                                AppString.enterPassword, validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                                controller: controller.passwordController,
                                textInputAction: TextInputAction.done,
                                obscureText: controller.passwordVisible.value,
                                suffixIcon: IconButton(
                                    icon: Icon(controller.passwordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      controller.passwordVisible.value =
                                          !controller.passwordVisible.value;
                                    }))),
                        SizedBox(height: 30.h),
                        MyElevatedButton(
                            width: double.infinity,
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.callLoginApi();
                              }
                            },
                            child: Text(AppString.login,
                                style: GoogleFonts.poppins(
                                    color: AppColor.blackColor,
                                    fontSize: 16.sp)))
                      ])))
        ])));
  }

  _view() => Column(children: [
        Container(
            height: 0.26.sh,
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                gradient: LinearGradient(
                    colors: [Color(0xFFB68E04), Color(0xFFEFD95B)],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0)))),
        Stack(children: [
          Container(
              height: 0.05.sh,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                  gradient: LinearGradient(
                      colors: [Color(0xFFB68E04), Color(0xFFEFD95B)],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0)))),
          Container(
              height: 0.05.sh,
              decoration: const BoxDecoration(
                  color: AppColor.blackColor,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(50))))
        ])
      ]);
}
