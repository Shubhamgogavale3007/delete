import 'package:dio/dio.dart' as form;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:shubham_practical/Services/app_repository.dart';
import 'package:shubham_practical/Utils/utils.dart';
import 'package:shubham_practical/Widgets/snackbar.dart';
import 'package:shubham_practical/utils/logger.dart';

class ReplyController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();
  var repository = AppRepository();
  String? id;
  RxList<XFile> selectedImages = RxList.empty();
  final formData = form.FormData();

  @override
  void onInit() {
    if (Get.arguments != null) {
      id = Get.arguments;
    }
    super.onInit();
  }

  // select images from gallery
  void selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final selectedImage = await picker.pickMultiImage(limit: 5);

    if (selectedImage.isNotEmpty) {
      selectedImages.addAll(selectedImage);
      Logger().v('Image selected');
    } else {
      snackBar('Image not selected.');
    }
  }

  submitReply() {
    // check for message and image if empty or not
    if (messageController.text.isEmpty) {
      snackBar('Please enter message');
    } else if (selectedImages.isEmpty) {
      snackBar('Please select images');
    } else {
      Utils.showProgressDialog();

      // add fields and data
      formData.fields.add(MapEntry("id", id!));
      formData.fields.add(MapEntry("message", messageController.text));
      for (int i = 0; i < selectedImages.length; i++) {
        final XFile xfile = selectedImages[i];
        final fileName = path.basename(xfile.path);
        formData.files.add(MapEntry(
          'attachments', // Key used in the form data
          form.MultipartFile.fromFileSync(selectedImages[i].path,
              filename: fileName),
        ));
      }
// call api
      repository.callSubmitReplyApi(formData).then((response) {
        if (response.isSuccess == true) {
          Utils.hideProgressDialog();
          Get.back();
          snackBar(response.message.toString());
        } else {
          Utils.hideProgressDialog();
          Get.back();
          snackBar(response.message.toString());
        }
      });
    }
  }
}
