import 'package:get/get.dart';
import 'package:object_tive_test/src/data/remote/respone/app_respone.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/extension/string.dart';

class RegisterBloc extends BaseBloc{

  Future<bool> btnRegister(String userName, String fullName,String phoneNumber, String email, DateTime birthday, String password, String confirmPassword) async{
  bool a= checkValidate(userName,fullName,email,birthday,password,confirmPassword);
    if(a){
      //Call APi
      bool check = await AppResponse().register(userName, fullName, email,phoneNumber ,birthday, password);

      if(check==true) Get.snackbar("afd", "Đăng kí thành công");
      else Get.snackbar("àdfafsf", "Dang ki that bai");

    }
  }

  bool checkValidate(String userName, String fullName, String email, DateTime birthday, String password, String confirmPassword) {
      if(userName.trim().contains(' ')) {
          Get.snackbar("Lỗi","Tên tài khoản không được có khoản trắng");
          return false;
      }

      if(fullName.trim().length==0){
        Get.snackbar("Lỗi", "Họ và tên không được để trống");
        return false;
      }

      if(!email.isMyEmail()){
        Get.snackbar("Lỗi", "Email không hợp lệ");
        return false;
      }

      if(!birthday.isBefore(DateTime.now())){
        Get.snackbar("Lỗi", "Ngày sinh không hợp lệ");
        return false;
      }

      if(password.length<=6){
        Get.snackbar("Lỗi", "Mật khẩu quá ngắn");
        return false;
      }

      if(password != confirmPassword){
        Get.snackbar("Lỗi", "Mật khẩu xác nhận không chính xác");
        return false;
      }

      return true;
  }
}