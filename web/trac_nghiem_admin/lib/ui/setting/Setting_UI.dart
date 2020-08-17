import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trac_nghiem_admin/ui/home/InputQuestion/InputQuestionUI.dart';

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
        Text("ĐIỀU CHỈNH CÂU HỎI", style: TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
      ],
    );
  }
}
