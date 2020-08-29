import 'dart:html';

import 'package:flutter/material.dart';
import 'package:object_tive_test/src/utlis/widget/app_bar.dart';

class InfoUI extends StatefulWidget {
  static String  routeName ="InfoUI";
  @override
  _InfoUIState createState() => _InfoUIState();
}

class _InfoUIState extends State<InfoUI> {

  String _selectedChucVu;

  bool _loading;

  bool _chekThayDoiPassWord;
  List<DropdownMenuItem<String>> _dropdownMenu;

  bool _chekThayDoiThongTin;

  List<File> _image;

  final TextEditingController _tenController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _soDTController = TextEditingController();
  final TextEditingController _chucVuController = TextEditingController();

  final TextEditingController _matKhauCuController = TextEditingController();
  final TextEditingController _matKhauMoiController = TextEditingController();
  final TextEditingController _nhapLaiMatKhauController =
  TextEditingController();
  final TextEditingController _tmpController = TextEditingController();

  final FocusNode _node = FocusNode();
  final FocusNode _tenFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _sdtFocusNode = FocusNode();

  final FocusNode _matkhaucuNode = FocusNode();
  final FocusNode _matkhaumoiNode = FocusNode();
  final FocusNode _nhaplaimatkhauNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AbsorbPointer(
//          absorbing: _loading,
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_node);
              },
              child:  Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: ScrollConfiguration(
                                behavior: CustomBehavior(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        width: double.infinity,
                                      ),
                                      GestureDetector(
                                          onTap: () =>
                                          (_chekThayDoiThongTin)
                                              ? showAlerDialog()
                                              : null,
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        35)),
                                                border: Border.all(
                                                    color: LightColors
                                                        .accentsColor,
                                                    width: 5
                                                )
                                            ),
                                            child: imageAvata(
                                                thongTinCaNhan.avatar),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10),
                                        child: Text(
                                          thongTinCaNhan.fullName,
                                          style:
                                          CustomTextStyles().title_1,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 8),
                                        child: GestureDetector(
                                          onTap: () => _thongTinCaNhanBloc
                                              .goToDangXuat(),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.4,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.red),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  2),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(vertical: 6),
                                              child: Text(
                                                tr("dangxuat"),
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                                textAlign:
                                                TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      CheckboxListTile(
                                        title:
                                        Text(tr("chinhsuathongtin")),
                                        controlAffinity:
                                        ListTileControlAffinity
                                            .leading,
                                        value: _chekThayDoiThongTin,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _chekThayDoiThongTin = value;
                                            if (value == false) {
                                              _chekThayDoiPassWord =
                                              false;
                                            }
                                          });
                                        },
                                        checkColor: Colors.white,
                                        activeColor: LightColors.accentsColor,
                                      ),
                                      CustomTextFiel(
                                          tr("ten"),
                                          _tenController,
                                          _tenFocusNode,
                                          _emailFocusNode,
                                          _chekThayDoiThongTin,
                                          TextInputType.text),
                                      CustomTextFiel(
                                          tr("email"),
                                          _emailController,
                                          _emailFocusNode,
                                          _sdtFocusNode,
                                          _chekThayDoiThongTin,
                                          TextInputType.emailAddress),
                                      CustomTextFiel(
                                          tr("sdt"),
                                          _soDTController,
                                          _sdtFocusNode,
                                          null,
                                          _chekThayDoiThongTin,
                                          TextInputType.phone),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: DefaultSize
                                                .padding_deffault),
                                        child: GestureDetector(
                                          behavior:
                                          HitTestBehavior.translucent,
//                                        onTap: () => thayDoiChucVu(
//                                            thongTinCaNhan),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: DefaultSize
                                                          .padding_deffault -
                                                          2),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        _selectedChucVu,
                                                        style: TextStyle(
                                                            color: (_chekThayDoiThongTin)
                                                                ? Colors
                                                                .black
                                                                : Colors
                                                                .grey,
                                                            fontSize: 16),
                                                      ),
//                                                    Icon(
//                                                      Icons
//                                                          .arrow_drop_down,
//                                                      color:
//                                                      (_chekThayDoiThongTin)
//                                                          ? Colors
//                                                          .black
//                                                          : Colors
//                                                          .grey,
//                                                    )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 1,
                                                  color:
                                                  (_chekThayDoiThongTin)
                                                      ? Colors.black
                                                      : Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      CheckboxListTile(
                                        title: Text("Đổi mật khẩu"),
                                        controlAffinity:
                                        ListTileControlAffinity
                                            .leading,
                                        value: _chekThayDoiPassWord,
                                        onChanged: (bool value) {
                                          setState(() {
                                            if (_chekThayDoiThongTin ==
                                                false) {
                                              _chekThayDoiPassWord =
                                              false;
                                            } else
                                              _chekThayDoiPassWord =
                                                  value;
                                          });
                                        },
                                        checkColor: Colors.white,
                                        activeColor: LightColors.accentsColor,
                                      ),
                                      Visibility(
                                        visible: _chekThayDoiPassWord,
                                        child: Column(
                                          children: <Widget>[
                                            CustomTextFiel_2(
                                                tr("matkhaucu"),
                                                _matKhauCuController,
                                                _matkhaucuNode,
                                                _matkhaumoiNode),
                                            CustomTextFiel_2(
                                                tr("matkhaumoi"),
                                                _matKhauMoiController,
                                                _matkhaumoiNode,
                                                _nhaplaimatkhauNode),
                                            CustomTextFiel_2(
                                                tr("nhaplaimatkhau"),
                                                _nhapLaiMatKhauController,
                                                _nhaplaimatkhauNode,
                                                null),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 68,
                                color: Color(0xfff2f2f2),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () => goToBack(),
                                      behavior:
                                      HitTestBehavior.translucent,
                                      child: SizedBox(
                                        height: 68,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.2,
                                        child: Center(
                                          child: Text(
                                            tr("thoat"),
                                            style: CustomTextStyles()
                                                .titleButtonLoginInfor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => luuThongTinCaNhan(
                                          thongTinCaNhan),
                                      behavior:
                                      HitTestBehavior.translucent,
                                      child: SizedBox(
                                        height: 68,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.2,
                                        child: Center(
                                          child: Text(
                                            tr("luu"),
                                            style: CustomTextStyles()
                                                .titleButtonLoginInfor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  (_loading) ? CircularProgressIndicator() : Container(),
                ],
              )
          ),
        ),
      ),
    );
  }
}
