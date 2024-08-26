import 'package:get/get.dart';
import 'package:shubham_practical/Presentations/Login/controller/login_controller.dart';
import 'package:shubham_practical/Presentations/Reply/controller/reply_controller.dart';
import 'package:shubham_practical/Presentations/Support/controller/support_controller.dart';
import 'package:shubham_practical/Presentations/TicketDetails/controller/ticket_details_controller.dart';

class CustomBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SupportController>(() => SupportController(), fenix: true);
    Get.lazyPut<TicketDetailsController>(() => TicketDetailsController(),
        fenix: true);
    Get.lazyPut<ReplyController>(() => ReplyController(), fenix: true);
  }
}
