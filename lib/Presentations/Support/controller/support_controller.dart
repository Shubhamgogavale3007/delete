import 'package:get/get.dart';
import 'package:shubham_practical/Model/support_response_model.dart';
import 'package:shubham_practical/Services/all_request.dart';
import 'package:shubham_practical/Services/app_repository.dart';
import 'package:shubham_practical/Widgets/snackbar.dart';

class SupportController extends GetxController {
  List<Records> recordList = RxList.empty();
  var page = 1;
  var limits = 10;
  RxString dropdownValue = 'Open'.obs;
  var repository = AppRepository();
  var isLoading = false.obs;

  @override
  void onInit() {
    callSupportApi(null);
    super.onInit();
  }

  // call support api
  callSupportApi(String? value) {
    isLoading(true);
    repository
        .callSupportApi(SupportRequest(
            pageNumber: page,
            pageSize: limits,
            filters: FilterRequest(status: value ?? dropdownValue.value)))
        .then((response) {
      if (response.isSuccess == true) {
        recordList.clear();
        isLoading(false);
        SupportResponseData supportResponseData =
            SupportResponseData.fromJson(response.data);

        if (supportResponseData.records!.isNotEmpty) {
          recordList = supportResponseData.records!;
        }
      } else {
        isLoading(false);
        snackBar(response.message.toString());
      }
    });
  }
}
