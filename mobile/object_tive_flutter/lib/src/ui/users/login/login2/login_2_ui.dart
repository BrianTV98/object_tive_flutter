import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/widget/alert_dialog_custom.dart';
import 'package:object_tive_test/src/utlis/widget/app_bar.dart';

class Login2UI extends StatefulWidget {
  @override
  _Login2UIState createState() => _Login2UIState();
}

class _Login2UIState extends State<Login2UI> {
  Color color = ThemeData().primaryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            ImageManager().iconAvata,
            height: SizeManager().sizeIconAvatDefault,
            width: SizeManager().sizeIconAvatDefault,
          ),
          Text(
            "TranHieu",
            style:
                TextStyle(fontSize: SizeManager().size_header_3, color: color),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeManager().size_padding_default, vertical: SizeManager().size_padding_default),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Mật khẩu",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(
                          color: color, width: 2, style: BorderStyle.solid))),
            ),
          ),

          GestureDetector(
//            onTap: ()=> Get.dialog(AlertDialogCustom(title: "Test thu nghiem", textConfirm: "Đồng ý", textCancel: "Không đồng ý",)),
            child: Container(
              padding: EdgeInsets.all(SizeManager().size_padding_default),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0,2),
                  )
                ]
              ),
              child: Text("Tiếp tục", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}
