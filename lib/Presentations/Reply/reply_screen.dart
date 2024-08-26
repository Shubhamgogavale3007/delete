import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubham_practical/Core/app_color.dart';
import 'package:shubham_practical/Core/app_string.dart';
import 'package:shubham_practical/Presentations/Reply/controller/reply_controller.dart';
import 'package:shubham_practical/Widgets/custom_widgets.dart';
import 'package:shubham_practical/Widgets/elevated_button.dart';

class ReplyScreen extends GetView<ReplyController> {
  const ReplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.blackColor,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: AppColor.goldColor),
            ),
            centerTitle: true,
            backgroundColor: AppColor.blackColor,
            title: Text(AppString.replyTicket,
                style: GoogleFonts.poppins(
                    color: AppColor.goldColor, fontSize: 18.sp))),
        body: Obx(() => SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: controller.formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppString.message,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.goldColor,
                                  fontSize: 16.sp)),
                          SizedBox(height: 10.h),
                          CustomWidgets.customTextField(
                              AppString.enterReplyMessage,
                              minLines: 3,
                              maxLines: 5, validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Message';
                            }
                            return null;
                          },
                              controller: controller.messageController,
                              textInputAction: TextInputAction.done),
                          SizedBox(height: 20.h),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppString.uploadPrintShot,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.goldColor,
                                        fontSize: 16.sp)),
                                Visibility(
                                    visible:
                                        controller.selectedImages.isNotEmpty,
                                    child: GestureDetector(
                                        onTap: () =>
                                            controller.selectImageFromGallery(),
                                        child: Text(AppString.addMore,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.goldColor,
                                                fontSize: 16.sp))))
                              ]),
                          SizedBox(height: 10.h),
                          controller.selectedImages.isNotEmpty
                              ? SizedBox(
                                  height: 80.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.selectedImages.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: Stack(children: [
                                              Container(
                                                  height: 80.h,
                                                  width: 80.w,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Image.file(
                                                      File(controller
                                                          .selectedImages[index]
                                                          .path),
                                                      fit: BoxFit.cover)),
                                              GestureDetector(
                                                  child: const Icon(
                                                      Icons.cancel,
                                                      color:
                                                          AppColor.whiteColor),
                                                  onTap: () {
                                                    controller.selectedImages
                                                        .removeAt(index);
                                                  })
                                            ]));
                                      }))
                              : GestureDetector(
                                  onTap: () =>
                                      controller.selectImageFromGallery(),
                                  child: DottedBorder(
                                      color: AppColor.goldColor,
                                      strokeWidth: 2,
                                      borderType: BorderType.RRect,
                                      radius: const Radius.circular(10),
                                      dashPattern: const [10, 10],
                                      child: Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                        Icons
                                                            .cloud_upload_outlined,
                                                        color: AppColor
                                                            .whiteColor),
                                                    SizedBox(height: 5.h),
                                                    Text(
                                                        AppString
                                                            .chooseFilesHere,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColor
                                                                    .goldColor,
                                                                fontSize:
                                                                    16.sp)),
                                                    SizedBox(height: 5.h),
                                                    Text(AppString.imageLimit,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColor
                                                                    .goldColor
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize:
                                                                    12.sp))
                                                  ]))))),
                          SizedBox(height: 45.h),
                          MyElevatedButton(
                              onPressed: () => controller.submitReply(),
                              child: Text(AppString.submitReply,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.blackColor,
                                      fontSize: 14.sp)))
                        ]))))));
  }
}
