import 'package:get/get.dart';
import 'package:object_tive_test/src/data/remote/respone/app_respone.dart';
import 'package:object_tive_test/src/ui/home/home_ui.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';

class LoginBloc extends BaseBloc with AppResponse{

  Future btnLogin(String username, String password)async{
      if(checkValidation(username, password)){
        try {
          bool check = await login(username, password);
          if (check == null) print("afdaff");
          if (check)
            print("afdaff");
          else
            print("afdaff");
        }
        catch(e){
          print("error  ${e.toString()}");
        }
      }
      else Get.snackbar("Lỗi", "Tên tài khoản hoặc mật khẩu không hợp lệ");
  }

  bool checkValidation(String usename, String password){
    if(usename.trim().length<=0) return false;
    if(password.length<=0) return false;
    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
