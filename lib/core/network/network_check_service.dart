import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:kovela/core/widgets/custom_snac_bars.dart';
import 'package:nivaas/core/const/api_const.dart';

mixin NetworkCheckService {
  Future<bool> checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    // if (!result) {
    //   CustomSnacBars()
    //       .showErrorSnack(title: NETWORK, message: 'No Network found');
    // }
    return result;
  }
}
