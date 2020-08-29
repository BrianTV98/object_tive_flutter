import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:object_tive_test/src/data/local/share_pref.dart';
import 'package:object_tive_test/src/data/models/User.dart';
import 'package:object_tive_test/src/data/models/result_respone.dart';
import 'package:object_tive_test/src/data/remote/respone/app_respone.dart';
import 'package:object_tive_test/src/ui/home/home_ui.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/prerence_namespace.dart';


class LoginBloc extends BaseBloc{

  StreamController<bool> _isLoadingController =  StreamController<bool>.broadcast();
  StreamSink<bool> get isLoadingSink => _isLoadingController.sink;
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  Future btnLogin(String username, String password)async{
    isLoadingSink.add(true);

    if(checkValidation(username, password)){
      User user =  await AppResponse().login(username, password);
      if(user==null) Get.snackbar("Lỗi", "Thông tin đăng nhập không chính xác");
      else{
        if(user.isAdmin==false){
          writeLocalDate(username,user.linkavata,user.email);
          Get.offAllNamed(HomeUI.routName);
        }
        else  Get.snackbar("Lỗi", "Bạn không có quyền đăng nhập vào đây");
      }

    }
    else Get.snackbar("Lỗi", "Tên đăng nhập hoặc mật khẩu không được để trống");
    isLoadingSink.add(false);
  }

  bool checkValidation(String username, String password){
    if(username.trim().length<=0) return false;
    if(password.length<=0) return false;
    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _isLoadingController.close();
    super.dispose();
  }

  void writeLocalDate( String  userName, String linkAvata, String gmail) {
    //isName
    //userName

    SharedPref.instance.setBool(NameSpace().isLogin, true);
    SharedPref.instance.setString(NameSpace().userName, userName);
    SharedPref.instance.setString(NameSpace().linkAvata, linkAvata);
    SharedPref.instance.setString(NameSpace().gmail, gmail);
  }

}
