import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubham_practical/Core/app_color.dart';
import 'package:shubham_practical/Core/app_string.dart';
import 'package:shubham_practical/Presentations/Reply/controller/reply_controller.dart';
import 'package:shubham_practical/Presentations/Reply/reply_screen.dart';
import 'package:shubham_practical/Presentations/TicketDetails/controller/ticket_details_controller.dart';
import 'package:shubham_practical/Utils/utils.dart';
import 'package:shubham_practical/Widgets/elevated_button.dart';

class TicketDetailsScreen extends GetView<TicketDetailsController> {
  const TicketDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.blackColor,
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColor.goldColor)),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColor.blackColor,
            title: Text(AppString.ticketDetails,
                style: GoogleFonts.poppins(
                    color: AppColor.goldColor, fontSize: 18.sp))),
        body: Obx(() => (controller.isLoading.value)
            ? Utils.mainLoader()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _containerView(),
                      SizedBox(height: 20.h),
                      _listView()
                    ]))));
  }

  _containerView() => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  height: 10.h,
                  width: 10.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.greenColor)),
              SizedBox(width: 5.w),
              Text(
                  controller.detailsData.isOpen!
                      ? AppString.open
                      : AppString.close,
                  style: GoogleFonts.poppins(
                      color: AppColor.greenColor, fontSize: 10.sp))
            ]),
            SizedBox(height: 10.h),
            Row(children: [
              Text('${AppString.requestType} :  ',
                  style: GoogleFonts.poppins(
                      color: AppColor.goldColor.withOpacity(0.50),
                      fontSize: 14.sp)),
              Expanded(
                  child: Text(controller.detailsData.requestType ?? '',
                      style: GoogleFonts.poppins(
                          color: AppColor.goldColor, fontSize: 14.sp)))
            ]),
            Row(children: [
              Text('${AppString.ticketNumber} :  ',
                  style: GoogleFonts.poppins(
                      color: AppColor.goldColor.withOpacity(0.50),
                      fontSize: 14.sp)),
              Expanded(
                  child: Text(controller.detailsData.ticketId ?? '',
                      style: GoogleFonts.poppins(
                          color: AppColor.goldColor, fontSize: 14.sp)))
            ]),
            Row(children: [
              Text('${AppString.date} :  ',
                  style: GoogleFonts.poppins(
                      color: AppColor.goldColor.withOpacity(0.50),
                      fontSize: 14.sp)),
              Expanded(
                  child: Text(
                      controller.detailsData.createdAt!.split(',').first,
                      style: GoogleFonts.poppins(
                          color: AppColor.goldColor, fontSize: 14.sp)))
            ])
          ])));

  _listView() => Expanded(
      child: (controller.detailsData.reply!.isEmpty)
          ? Center(
              child: Text(AppString.noDataFound,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: AppColor.goldColor,
                      fontSize: 18.sp)))
          : ListView.builder(
              padding: EdgeInsets.only(bottom: 0.2.sh),
              itemCount: controller.detailsData.reply!.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(AppString.conversation,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.goldColor,
                                                fontSize: 14.sp)),
                                        MyElevatedButton(
                                            onPressed: () {
                                              Get.to(const ReplyScreen(),
                                                      arguments: controller
                                                          .detailsData
                                                          .reply![index]
                                                          .sId)!
                                                  .then((value) => Get.delete<
                                                      ReplyController>());
                                            },
                                            child: Text(AppString.reply,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.blackColor,
                                                    fontSize: 14.sp)))
                                      ]),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                            imageUrl: controller
                                                    .detailsData
                                                    .reply![index]
                                                    .profileImage ??
                                                '',
                                            imageBuilder: (context, imageProvider) => Container(
                                                height: 45.h,
                                                width: 45.w,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.fill))),
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator.adaptive(
                                                    valueColor:
                                                        const AlwaysStoppedAnimation(
                                                            AppColor.goldColor),
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget: (context, url, error) =>
                                                const Icon(Icons.error)),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Text(
                                                  controller
                                                          .detailsData
                                                          .reply![index]
                                                          .replyBy ??
                                                      '',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColor.goldColor,
                                                      fontSize: 16.sp)),
                                              Text(
                                                  controller
                                                          .detailsData
                                                          .reply![index]
                                                          .message ??
                                                      '',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColor.goldColor,
                                                      fontSize: 12.sp)),
                                              SizedBox(height: 10.h),
                                              Visibility(
                                                  visible: controller
                                                      .detailsData
                                                      .reply![index]
                                                      .attachments!
                                                      .isNotEmpty,
                                                  child: SizedBox(
                                                    height: 45.h,
                                                    width: 45.w,
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: controller
                                                            .detailsData
                                                            .reply![index]
                                                            .attachments!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return CachedNetworkImage(
                                                            imageUrl: controller
                                                                    .detailsData
                                                                    .reply![
                                                                        index]
                                                                    .profileImage ??
                                                                '',
                                                            imageBuilder: (context, imageProvider) => Container(
                                                                height: 45.h,
                                                                width: 45.w,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    image: DecorationImage(
                                                                        image:
                                                                            imageProvider,
                                                                        fit: BoxFit
                                                                            .fill))),
                                                            progressIndicatorBuilder: (context,
                                                                    url,
                                                                    downloadProgress) =>
                                                                CircularProgressIndicator(
                                                                    value: downloadProgress
                                                                        .progress),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Icon(Icons
                                                                    .error),
                                                          );
                                                        }),
                                                  ))
                                            ]))
                                      ])
                                ]))));
              }));
}
