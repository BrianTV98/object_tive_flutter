import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:trac_nghiem_admin/data/app_respone.dart';
import 'package:trac_nghiem_admin/ui/home/home_ui.dart';
import 'package:trac_nghiem_admin/utils/base_bloc.dart';
class LoginBloc extends BaseBloc{

  StreamController<bool> _isLoadingController =  StreamController<bool>.broadcast();
  StreamSink<bool> get isLoadingSink => _isLoadingController.sink;
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  Future btnLogin(String username, String password)async{
    isLoadingSink.add(true);
    if(checkValidation(username, password)){
      bool result =  await AppResponse().login(username, password);


      if(result) Get.toNamed(HomeUI.routName);
      else Get.snackbar("Lỗi", "Thông tin đăng nhập không chính xác");
    }
    else Get.snackbar("Lỗi", "Tên đăng nhập hoặc mật khẩu không được để trống",snackPosition: SnackPosition.TOP,);
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

  void writeLocalDate( String  userName) {
    //isName
    //userName
//
//    SharedPref.instance.setBool(NameSpace().isLogin, true);
//    SharedPref.instance.setString(NameSpace().userName, userName);

  }

}
