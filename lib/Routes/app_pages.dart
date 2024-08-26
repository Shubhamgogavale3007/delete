import 'package:get/get.dart';
import 'package:shubham_practical/Presentations/Login/login_screen.dart';
import 'package:shubham_practical/Presentations/Reply/reply_screen.dart';
import 'package:shubham_practical/Presentations/Support/support_screen.dart';
import 'package:shubham_practical/Presentations/TicketDetails/ticket_details_screen.dart';
import 'package:shubham_practical/Routes/app_routes.dart';
import 'package:shubham_practical/routes/bindings.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: CustomBindings(),
    ),
    GetPage(
      name: AppRoutes.support,
      page: () => const SupportScreen(),
      binding: CustomBindings(),
    ),
    GetPage(
      name: AppRoutes.ticketDetails,
      page: () => const TicketDetailsScreen(),
      binding: CustomBindings(),
    ),
    GetPage(
      name: AppRoutes.reply,
      page: () => const ReplyScreen(),
      binding: CustomBindings(),
    ),
  ];
}
