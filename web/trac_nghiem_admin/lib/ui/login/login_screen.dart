import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trac_nghiem_admin/manager/size_manager.dart';
import 'package:trac_nghiem_admin/ui/login/login_bloc.dart';
import 'package:trac_nghiem_admin/utils/base_bloc.dart';

class LoginScreenUI extends StatefulWidget {
  static String routName = "/LoginScreenUI";

  @override
  _LoginScreenUIState createState() => _LoginScreenUIState();
}

class _LoginScreenUIState extends State<LoginScreenUI> {
  LoginBloc _loginBloc;

  Color colors = ThemeData().primaryColor;

  FocusNode _focusNode = FocusNode();
  FocusNode _useNameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  TextEditingController _textUserNameController = TextEditingController();
  TextEditingController _textPassWordController = TextEditingController();

  bool _visiblePassWord = false;

  @override
  void initState() {
    // TODO: implement initState
   _loginBloc= BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                  "https://a.deviantart.net/avatars-big/m/e/melodoodle.jpg?4"),

              SizedBox(
                height: 16,
              ),

              TextFormField(
                focusNode: _useNameFocusNode,
                controller: _textUserNameController,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (term) => _changeFocus(
                    context, _useNameFocusNode, _passwordFocusNode),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Tên Tài Khoản',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),

              SizedBox(
                height: 8,
              ),

              TextFormField(
                controller: _textPassWordController,
                focusNode: _passwordFocusNode,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_term) =>
                    _changeFocus(context, _passwordFocusNode, null),
                obscureText: !_visiblePassWord,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _visiblePassWord = (!_visiblePassWord);
                        });
                      },
                      icon: Icon(_visiblePassWord
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    hintText: 'Mật khẩu',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),

              SizedBox(
                height: 8,
              ),


              GestureDetector(
                onTap: () => btnDangNhap(),
                behavior: HitTestBehavior.translucent,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeManager().size_padding_default)),
                    color: colors,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    "Đăng nhập".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Padding(
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Quên mật khẩu",
                        style: TextStyle(color: colors),
                      ),
                      behavior: HitTestBehavior.translucent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 14,
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Text(
                          "Tạo tài khoản",
                          style: TextStyle(
                            color: colors,
                          ),
                        ))
                  ],
                ),
              )
            ],
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

  void _toggle() {
    setState(() {
      _visiblePassWord = !_visiblePassWord;
    });
  }

  btnDangNhap() {
    _loginBloc.btnLogin(_textUserNameController.text, _textPassWordController.text);
  }

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      body: Text("Àdfafs"),
//    );
//  }
}
