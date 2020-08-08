import 'package:flutter/material.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/uic/app_bar.dart';

class ForogtPasswordUI extends StatefulWidget {
  @override
  _ForogtPasswordUIState createState() => _ForogtPasswordUIState();
}

class _ForogtPasswordUIState extends State<ForogtPasswordUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(

      ),
      backgroundColor: ThemeData().primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Image.asset(ImageManager().iconFix, height: SizeManager().sizeIconAvatDefault*2,width: SizeManager().sizeIconAvatDefault*2,),
              Text("Quên mật khẩu", style: TextStyle(fontSize: SizeManager().size_header_0, color: Colors.white, fontWeight: FontWeight.bold),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeManager().size_padding_default,vertical: SizeManager().size_padding_default),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Nhập Email",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:EdgeInsets.only(left: SizeManager().size_padding_large),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:SizeManager().size_padding_large*2,right: SizeManager().size_padding_large*2, top: SizeManager().size_padding_large),
                child: Center(child: Text("Bạn sẽ nhận được mã xác nhận thông qua email của mình", style: TextStyle(color: Colors.white),)),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeManager().size_padding_default),
                padding: EdgeInsets.symmetric(horizontal: SizeManager().size_padding_default,vertical: SizeManager().size_padding_small),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white,
                    width: 1
                  )
                ),
                child: Text(
                  "Tiếp tục",style: TextStyle(fontWeight:FontWeight.bold, color: Colors.white, fontSize: SizeManager().size_header_2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

