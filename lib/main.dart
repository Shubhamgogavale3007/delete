import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shubham_practical/Core/app_color.dart';
import 'package:shubham_practical/Routes/app_pages.dart';
import 'package:shubham_practical/Routes/app_routes.dart';
import 'package:shubham_practical/Utils/app_model.dart';
import 'package:shubham_practical/routes/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppModel appModel = AppModel();
  await appModel.setupInitial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        child: GetMaterialApp(
            theme: ThemeData(
                textSelectionTheme: const TextSelectionThemeData(
                    cursorColor: AppColor.goldColor,
                    selectionColor: AppColor.goldColor,
                    selectionHandleColor: AppColor.goldColor)),
            initialBinding: CustomBindings(),
            getPages: AppPages.pages,
            initialRoute: AppRoutes.login,
            debugShowCheckedModeBanner: false));
  }
}
