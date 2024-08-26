import 'package:get/get.dart';
import 'package:shubham_practical/Model/ticket_details_response_model.dart';
import 'package:shubham_practical/Services/all_request.dart';
import 'package:shubham_practical/Services/app_repository.dart';
import 'package:shubham_practical/Widgets/snackbar.dart';

class TicketDetailsController extends GetxController {
  TicketDetailsResponseData detailsData = TicketDetailsResponseData();
  var repository = AppRepository();
  var isLoading = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      _callDetailsApi(Get.arguments);
    }
    super.onInit();
  }

  // get details api
  void _callDetailsApi(String id) {
    isLoading(true);
    repository
        .callTicketDetailsApi(TicketDetailsRequest(id: id))
        .then((response) {
      if (response.isSuccess == true) {
        isLoading(false);
        TicketDetailsResponseData ticketDetailsResponseData =
            TicketDetailsResponseData.fromJson(response.data);

        detailsData = ticketDetailsResponseData;
      } else {
        isLoading(false);
        snackBar(response.message.toString());
      }
    });
  }
}
