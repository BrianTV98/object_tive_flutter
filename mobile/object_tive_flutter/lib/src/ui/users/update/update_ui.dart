import 'package:flutter/material.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/widget/app_bar.dart';

class UpdateUI extends StatefulWidget {
  @override
  _UpdateUIState createState() => _UpdateUIState();
}

class _UpdateUIState extends State<UpdateUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(

      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(ImageManager().iconUpdate),
            SizedBox(height: SizeManager().size_padding_default,),
            Text("New Version 2.5"),
            Container(
              margin: EdgeInsets.only(top: SizeManager().size_padding_default),
              padding: EdgeInsets.symmetric(horizontal: SizeManager().size_padding_default, vertical: SizeManager().size_padding_small),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: ThemeData().primaryColor,
                  width: 1
                )
              ),
              child: Text("Cập nhập ngay", style: TextStyle(color: ThemeData().primaryColor),),
            )
          ],
        ),
      ),
    );
  }
}
