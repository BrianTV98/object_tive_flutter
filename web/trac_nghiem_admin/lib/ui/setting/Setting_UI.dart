import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trac_nghiem_admin/ui/home/InputQuestion/InputQuestionUI.dart';
import 'package:trac_nghiem_admin/ui/home/home_ui.dart';
import 'package:trac_nghiem_admin/ui/login/login_screen.dart';

class SettingUI extends StatefulWidget {

  static String routerName="SettingUI";

  @override
  _SettingUIState createState() => _SettingUIState();
}

class _SettingUIState extends State<SettingUI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height/4,
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: ()=>Get.toNamed(InputQuestionUI.routerName),
          child: Text("THÊM CÂU HỎI",style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),),
        ),

        SizedBox(
          height: 30,
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: ()=> Get.offAllNamed(HomeUI.routName),
          child: Text("ĐIỀU CHỈNH CÂU HỎI", style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: ()=> Get.offAllNamed(LoginScreenUI.routName),
          child: Text("ĐĂNG XUẤT", style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),),
        ),
      ],
    );
  }
}
