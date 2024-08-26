import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shubham_practical/Services/reachability.dart';
import 'package:shubham_practical/utils/logger.dart';

import 'pref_utils.dart';

class AppModel with ChangeNotifier {
  AppModel() {
    Logger().v("App Model instance created");
  }

  Future setupInitial() async {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    Logger().v(" ------ Perform Initial Setup ------ ");

    /// Wait until setup reachability
    Reachability reachability = Reachability();
    await reachability.setUpConnectivity();
    Logger().v("Network status : ${reachability.connectStatus}");

    await PrefUtils.init();
    Logger().v(" ------ Shared Preference Setup ------ ");
  }
}
