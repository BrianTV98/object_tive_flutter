import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/ui/users/login/login_bloc.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/extension/widget.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/widget/disable_glow_listview_custom.dart';

class LoginScreenUI extends StatefulWidget {
  static String routName ="/LoginScreenUI";
  @override
  _LoginScreenUIState createState() => _LoginScreenUIState();
}

class _LoginScreenUIState extends State<LoginScreenUI> {

  LoginBloc _loginBloc;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }


  Color colors = ThemeData().primaryColor;

  FocusNode _focusNode =FocusNode();
  FocusNode _useNameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  TextEditingController _textUserNameController = TextEditingController();
  TextEditingController _textPassWordController = TextEditingController();

  bool _visiblePassWord = false;



  @override
  void initState() {
    // TODO: implement initState
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: DisableGlowListViewCustom(),
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                    ),
                    Image.asset(
                      ImageManager().iconAvata,
                      height: SizeManager().sizeIconAvatDefault,
                      width: SizeManager().sizeIconAvatDefault,
                    ).paddingBottom(SizeManager().size_padding_default*2),
                    TextFormField(
                      focusNode: _useNameFocusNode,
                      controller: _textUserNameController,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (term)=> _changeFocus(context,_useNameFocusNode,_passwordFocusNode),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Tên Tài Khoản hoặc emal',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16)))),
                    ).paddingHorizontal(SizeManager().size_padding_default),
                    TextFormField(
                      controller: _textPassWordController,
                      focusNode: _passwordFocusNode,
                      textInputAction:  TextInputAction.done,
                      onFieldSubmitted: (_term)=>_changeFocus(context, _passwordFocusNode, null),
                      obscureText: !_visiblePassWord,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                _visiblePassWord=(!_visiblePassWord);
                              });
                            },
                            icon: Icon( _visiblePassWord? Icons.visibility: Icons.visibility_off),
                          ),
                          hintText: 'Mật khẩu',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16)))),
                    ).paddingTLRB(
                        top: SizeManager().size_padding_default,
                        left: SizeManager().size_padding_default,
                        right: SizeManager().size_padding_default),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeManager().size_padding_default, vertical: SizeManager().size_padding_default),
                      child: GestureDetector(
                        onTap: ()=>btnDangNhap(),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(SizeManager().size_padding_default)),
                            color: colors,
                            boxShadow:[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
//                            offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Đăng nhập".toUpperCase(),style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ).padding(SizeManager().size_padding_default),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(SizeManager().size_padding_default, SizeManager().size_padding_default, SizeManager().size_padding_default, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Quên mật khẩu", style: TextStyle(color: colors),),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: SizeManager().size_padding_default/2),
                            child: Container(
                              height: SizeManager().size_header_5,
                              width: 1,
                              color: colors,
                            ),
                          ),
                          Text("Tạo tài khoản",style: TextStyle(color: colors, fontSize: SizeManager().size_header_4),)
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _changeFocus(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      if(nextFocus!=null) FocusScope.of(context).requestFocus(nextFocus);
  }

  void _toggle() {
    setState(() {
      _visiblePassWord = !_visiblePassWord;
    });
  }

   btnDangNhap() {
    _loginBloc.login(_textUserNameController.text, _textPassWordController.text);
  }
}
