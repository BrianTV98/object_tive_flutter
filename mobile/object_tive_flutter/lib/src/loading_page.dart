import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/ui/home/home_ui.dart';
import 'package:object_tive_test/src/ui/users/login/login2/login_2_ui.dart';
import 'package:object_tive_test/src/ui/users/login/login_ui.dart';
import 'package:object_tive_test/src/utlis/manager/prerence_namespace.dart';

import 'data/local/share_pref.dart';

class LoadingPage extends StatefulWidget {
  static String routerName ="/LoadingPage";
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // fetch data
//      await getToken();
      init();
//      Get.offAllNamed('testpage');
//      CheckInternet.getInstance();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void init() {
    bool isLogin = SharedPref.instance.getBool(NameSpace().isLogin);
    if (!isLogin) {
      Get.offAllNamed(LoginScreenUI.routName);
    } else {
      Get.offAllNamed(HomeUI.routName);

    }
  }

//  String localToken = SharedPref.instance.getString(LocalVariable().token);
//        if (localToken.isEmpty) {
//        String token = await FireBaseConfig.instance.getFireBaseToken();
//        SharedPref.instance.setString(LocalVariable().token, token);
//  }
}
