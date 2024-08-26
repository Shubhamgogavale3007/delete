import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubham_practical/Core/app_color.dart';
import 'package:shubham_practical/Core/app_string.dart';
import 'package:shubham_practical/Presentations/Support/controller/support_controller.dart';
import 'package:shubham_practical/Presentations/TicketDetails/controller/ticket_details_controller.dart';
import 'package:shubham_practical/Presentations/TicketDetails/ticket_details_screen.dart';
import 'package:shubham_practical/Utils/utils.dart';
import 'package:shubham_practical/Widgets/elevated_button.dart';

class SupportScreen extends GetView<SupportController> {
  const SupportScreen({super.key});

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
            title: Text(AppString.support,
                style: GoogleFonts.poppins(
                    color: AppColor.goldColor, fontSize: 18.sp))),
        body: Obx(() => (controller.isLoading.value)
            ? Utils.mainLoader()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    value: controller.dropdownValue.value,
                                    style: GoogleFonts.poppins(
                                        color: AppColor.goldColor,
                                        fontSize: 16.sp),
                                    icon: const Icon(Icons.filter_alt),
                                    iconEnabledColor: AppColor.goldColor,
                                    items: <String>['Open', 'Close']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                              style: GoogleFonts.poppins(
                                                  color: AppColor.goldColor,
                                                  fontSize: 16.sp)));
                                    }).toList(),
                                    onChanged: (value) {
                                      controller.dropdownValue.value = value!;
                                      controller.callSupportApi(
                                          controller.dropdownValue.value);
                                    })),
                            MyElevatedButton(
                                onPressed: () {},
                                child: Text(AppString.newTicket,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.blackColor,
                                        fontSize: 14.sp)))
                          ]),
                      SizedBox(height: 15.h),
                      _listView()
                    ]))));
  }

  _listView() => Expanded(
      child: (controller.recordList.isEmpty)
          ? Center(
              child: Text(AppString.noDataFound,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: AppColor.goldColor,
                      fontSize: 18.sp)))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: controller.recordList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Get.to(const TicketDetailsScreen(),
                              arguments: controller.recordList[index].sId)!
                          .then(
                              (value) => Get.delete<TicketDetailsController>());
                    },
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColor.goldColor)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w, left: 10.w, top: 10.h),
                                      child: Row(children: [
                                        Expanded(
                                            child: Text(
                                                controller.recordList[index]
                                                        .sId ??
                                                    '',
                                                style: GoogleFonts.poppins(
                                                    color: AppColor.goldColor,
                                                    fontSize: 14.sp))),
                                        Container(
                                            height: 10.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColor.greenColor)),
                                        SizedBox(width: 5.w),
                                        Text(
                                            controller.recordList[index].isOpen!
                                                ? AppString.open
                                                : AppString.close,
                                            style: GoogleFonts.poppins(
                                                color: AppColor.greenColor,
                                                fontSize: 10.sp))
                                      ])),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: const Divider(
                                          color: Colors.grey, height: 0)),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w,
                                          left: 10.w,
                                          bottom: 10.h),
                                      child: Row(children: [
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Text(AppString.ticketNumber,
                                                  style: GoogleFonts.poppins(
                                                      color: AppColor.goldColor,
                                                      fontSize: 10.sp)),
                                              Text(
                                                  controller.recordList[index]
                                                      .ticketId
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: AppColor.goldColor,
                                                      fontSize: 14.sp))
                                            ])),
                                        const Icon(Icons.calendar_month_sharp,
                                            color: AppColor.goldColor),
                                        SizedBox(width: 5.w),
                                        Text(
                                            controller
                                                .recordList[index].createdAt!
                                                .split(',')
                                                .first,
                                            style: GoogleFonts.poppins(
                                                color: AppColor.goldColor,
                                                fontSize: 10.sp))
                                      ]))
                                ]))));
              }));
}
