import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/extension/widget.dart';
import 'package:object_tive_test/src/utlis/widget/app_bar.dart';

class RegisterUI extends StatefulWidget {
  static String routName ="/RegisterUI";
  @override
  _RegisterUIState createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  TextEditingController _textUserNameController = TextEditingController();
  TextEditingController _textEmailController = TextEditingController();
  TextEditingController _textPasswordController = TextEditingController();
  TextEditingController _textConfirmPasswordController =
      TextEditingController();
  TextEditingController _textFullNameController = TextEditingController();
  TextEditingController _textAddressController = TextEditingController();
  TextEditingController _textPhoneController = TextEditingController();
  TextEditingController _textJobController = TextEditingController();

  DateTime _birthdayPicker = DateTime.now();

  FocusNode _userNameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();
  FocusNode _fullNameFocusNode = FocusNode();
  FocusNode _addressFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();
  FocusNode _textJobFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    kToolbarHeight,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: SizeManager().size_padding_default,
                            ),
                            Text("Tạo tài khoản",
                                style: TextStyle(
                                    color: ThemeData().primaryColor,
                                    fontSize: SizeManager().size_header_0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeManager().size_padding_default,
                              SizeManager().size_padding_small,
                              SizeManager().size_padding_default,
                              0),
                          child: TextFormField(
                            controller: _textUserNameController,
                            focusNode: _userNameFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (term) => _changeFocus(context,
                                _userNameFocusNode, _fullNameFocusNode),
                            decoration: InputDecoration(
                              hintText: "Tên tài khoản",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeManager().size_padding_default,
                              SizeManager().size_padding_small,
                              SizeManager().size_padding_default,
                              0),
                          child: TextFormField(
                            controller: _textFullNameController,
                            focusNode: _fullNameFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (term) => _changeFocus(
                                context, _fullNameFocusNode, _emailFocusNode),
                            decoration: InputDecoration(
                              hintText: "Họ và tên",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeManager().size_padding_default,
                              SizeManager().size_padding_small,
                              SizeManager().size_padding_default,
                              0),
                          child: TextFormField(
                            controller: _textEmailController,
                            focusNode: _emailFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (term) => _changeFocus(
                                context, _emailFocusNode, _phoneFocusNode),
                            decoration: InputDecoration(
                              hintText: "Email",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeManager().size_padding_default,
                              SizeManager().size_padding_default,
                              SizeManager().size_padding_default,
                              0),
                          child: TextFormField(
                            controller: _textPhoneController,
                            focusNode: _phoneFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (term) =>
                                _changeFocus(context, _phoneFocusNode, null),
                            decoration: InputDecoration(
                              hintText: "Số điện thoại",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => pickDate(),
                          behavior: HitTestBehavior.translucent,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: SizeManager().size_padding_default,
                                left: SizeManager().size_padding_default,
                                right: SizeManager().size_padding_default),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Ngày Sinh",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 16),
                                    ),
                                    Icon(Icons.calendar_today)
                                  ],
                                ),
                                SizedBox(
                                  height: SizeManager().size_padding_small,
                                ),
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black38,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeManager().size_padding_default,
                              0,
                              SizeManager().size_padding_default,
                              0),
                          child: TextFormField(
                            controller: _textPasswordController,
                            focusNode: _passwordFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (term) => _changeFocus(context,
                                _passwordFocusNode, _confirmPasswordFocusNode),
                            decoration: InputDecoration(
                              hintText: "Mật khẩu",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeManager().size_padding_default,
                              SizeManager().size_padding_default,
                              SizeManager().size_padding_default,
                              0),
                          child: TextFormField(
                            controller: _textConfirmPasswordController,
                            focusNode: _confirmPasswordFocusNode,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: "Nhập lại mật khẩu",
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: SizeManager().size_padding_default,
                                right: SizeManager().size_padding_default,
                                top: SizeManager().size_padding_small),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        "Bằng cách tạo 1 tài khoản bạn đã đồng ý với điều khoản dịch vụ và",
                                    style: TextStyle(color: Colors.grey)),
                                TextSpan(
                                    text: " chính sách Bảo mật",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: ThemeData().primaryColor),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () => Get.snackbar(
                                          "Chuyen Trang",
                                          "Điều khoản và chính sách bảo mật"))
                              ]),
                            )),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () => btnLogin(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ThemeData().primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(
                                      1, 5), // changes position of shadow
                                ),
                              ]),
                          child: Text(
                            "Tạo tài khoản",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ).padding(16),
                        ).paddingBottom(MediaQuery.of(context).padding.top),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
  }

  Future pickDate() async {
    DateTime dateTime = await showDatePicker(
      context: context,
      locale: const Locale("vi", "VN"),
      initialDate: DateTime(1990, 9),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
  }

  btnLogin() {
    
  }
}
