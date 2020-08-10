import 'package:flutter/material.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/extension/widget.dart';
class SettingUI extends StatefulWidget {
  static String routName ="/SettingUI";
  @override
  _SettingUIState createState() => _SettingUIState();
}

class _SettingUIState extends State<SettingUI> {
  Color color= ThemeData().primaryColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 16, top: SizeManager().size_padding_default),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(ImageManager().iconAvata, height: SizeManager().siz_icon_default*1.2, width: SizeManager().siz_icon_default*1.2,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tài khoản: tranhieu1998", style: TextStyle(color: color,fontSize: SizeManager().size_header_4),),
                              SizedBox(
                                height: 7,
                              ),
                              Text("Email: tranhieuglpk@gmail.com", style: TextStyle(color: color),),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 2,
                      color: color,
                    ).paddingTop(SizeManager().size_padding_default),

                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.only(left: 16),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(Icons.home,size: SizeManager().siz_icon_medium, color: color,),
                               SizedBox(width: SizeManager().size_padding_large,),
                               Text("Trang chủ", style: TextStyle(color: color, fontSize: SizeManager().size_header_3),)
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(Icons.person,size: SizeManager().siz_icon_medium, color: color,),
                               SizedBox(width: SizeManager().size_padding_large,),
                               Text("Thông tin cá nhân", style: TextStyle(color: color, fontSize: SizeManager().size_header_3),)
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(Icons.language,size: SizeManager().siz_icon_medium, color: color,),
                               SizedBox(width: SizeManager().size_padding_large,),
                               Text("Ngôn ngữ", style: TextStyle(color: color, fontSize: SizeManager().size_header_3),)
                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(Icons.autorenew,size: SizeManager().siz_icon_medium, color: color,),
                               SizedBox(width: SizeManager().size_padding_large,),
                               Text("Cập nhập", style: TextStyle(color: color, fontSize: SizeManager().size_header_3),)
                             ],
                           ),
                           SizedBox(
                             height: MediaQuery.of(context).size.height/5,
                           ),
                         ],
                       ),
                     ),
                   ),
                    Container(
                      padding: EdgeInsets.all(SizeManager().size_padding_default),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 5,
                                offset: Offset(-5,0),
                                spreadRadius:5
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Đăng xuất", style: TextStyle(color: color),),
                          Icon(Icons.power_settings_new,color: color,)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
