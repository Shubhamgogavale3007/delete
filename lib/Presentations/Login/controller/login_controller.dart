import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shubham_practical/Model/login_response_model.dart';
import 'package:shubham_practical/Presentations/Support/controller/support_controller.dart';
import 'package:shubham_practical/Presentations/Support/support_screen.dart';
import 'package:shubham_practical/Services/all_request.dart';
import 'package:shubham_practical/Services/app_repository.dart';
import 'package:shubham_practical/Utils/pref_utils.dart';
import 'package:shubham_practical/Utils/utils.dart';
import 'package:shubham_practical/Widgets/snackbar.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible = true.obs;
  var repository = AppRepository();

  callLoginApi() async {
    Utils.showProgressDialog();
    repository
        .callLoginApi(LoginRequest(
            username: userNameController.text,
            password: passwordController.text))
        .then((response) {
      Utils.hideProgressDialog();
      if (response.isSuccess == true) {
        LoginResponseData loginResponseData =
            LoginResponseData.fromJson(response.data);

        /// Set auth token
        PrefUtils.setAuthToken(loginResponseData.accessToken.toString());
        snackBar('Login Successfully');
        Get.to(const SupportScreen())!
            .then((value) => Get.delete<SupportController>());
      } else {
        snackBar(response.message.toString());
      }
    });
  }
}
