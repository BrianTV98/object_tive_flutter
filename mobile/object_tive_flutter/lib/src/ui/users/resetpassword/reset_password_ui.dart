import 'package:flutter/material.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/widget/app_bar.dart';

class ResetPasswordUi extends StatefulWidget {
  @override
  _ResetPasswordUIState createState() => _ResetPasswordUIState();
}

class _ResetPasswordUIState extends State<ResetPasswordUi> {

  TextEditingController _textPasswordController = TextEditingController();
  TextEditingController _textConfirmPasswordController = TextEditingController();

  FocusNode _textPasswordFocusNode = FocusNode();
  FocusNode _textConfirmPasswordNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      backgroundColor: ThemeData().primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
            behavior: HitTestBehavior.translucent,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(ImageManager().iconFix, height: SizeManager().sizeIconAvatDefault*2,width: SizeManager().sizeIconAvatDefault*2,),
                Text("Thiết lập lại mật khẩu", style: TextStyle(color: Colors.white, fontSize: SizeManager().size_header_0,fontWeight: FontWeight.bold),),
                Padding(
                  padding: EdgeInsets.only(top: SizeManager().size_padding_default,left: SizeManager().size_padding_default, right: SizeManager().size_padding_default),
                  child: TextFormField(
                    focusNode: _textPasswordFocusNode,
                    controller: _textPasswordController,
                    onFieldSubmitted: (term) => _changeFocus(context,_textPasswordFocusNode,_textConfirmPasswordNode),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Mật khẩu ",
                      prefixIcon: Icon(Icons.lock_outline),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.only(left: SizeManager().size_padding_default),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none
                      )
                    ),
                  )
                ),
                Padding(
                    padding: EdgeInsets.only(top: SizeManager().size_padding_default,left: SizeManager().size_padding_default, right: SizeManager().size_padding_default),
                    child: TextFormField(
                      focusNode: _textConfirmPasswordNode,
                      controller: _textConfirmPasswordController,
                      onFieldSubmitted: (term) => _changeFocus(context,_textConfirmPasswordNode,null),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Nhập lại mật khẩu",
                          prefixIcon: Icon(Icons.lock_outline),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.only(left: SizeManager().size_padding_default),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide.none
                          )
                      ),
                    )
                ),
                SizedBox(
                  height: SizeManager().size_padding_default,
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeManager().size_padding_default, vertical: SizeManager().size_padding_small ),
                      child: Text("Tiếp tục", style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeManager().size_header_3,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
  }

}
