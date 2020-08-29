import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/data/local/share_pref.dart';
import 'package:object_tive_test/src/ui/home/home_ui.dart';
import 'package:object_tive_test/src/ui/users/infor/infor_ui.dart';
import 'package:object_tive_test/src/ui/users/language/language_ui.dart';
import 'package:object_tive_test/src/ui/users/login/login_ui.dart';
import 'package:object_tive_test/src/ui/users/update/update_ui.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/manager/prerence_namespace.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/extension/widget.dart';
class SettingUI extends StatefulWidget {
  static String routName ="/SettingUI";
  @override
  _SettingUIState createState() => _SettingUIState();
}

class _SettingUIState extends State<SettingUI> {
  Color color= ThemeData().primaryColor;
  String email = SharedPref.instance.getString(NameSpace().gmail);
  String linkAvata = SharedPref.instance.getString(NameSpace().linkAvata);
  String username = SharedPref.instance.getString(NameSpace().userName);
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
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              border: Border.all(
                                color: Colors.blue,
                                width: 2
                              )
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: CachedNetworkImage(
                                height:SizeManager().siz_icon_default*1.2,
                                width: SizeManager().siz_icon_default*1.2,
                                imageUrl: linkAvata,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>  Image.asset("assets/images/icon_my_avata.jpg", height: SizeManager().siz_icon_default*1.2, width: SizeManager().siz_icon_default*1.2,),
                              ),
                            ),
                            height: 50,
                            width: 50,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tài khoản: $username", style: TextStyle(color: color,fontSize: SizeManager().size_header_4),),
                                SizedBox(
                                  height: 7,
                                ),
                                Text("Email: ${email.trim()}", style: TextStyle(color: color),),
                              ],
                            ),
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
                           GestureDetector(
                             behavior: HitTestBehavior.translucent,
                             onTap: ()=>Get.offAllNamed(HomeUI.routName),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Icon(Icons.home,size: SizeManager().siz_icon_medium, color: color,),
                                 SizedBox(width: SizeManager().size_padding_large,),
                                 Text("Trang chủ", style: TextStyle(color: color, fontSize: SizeManager().size_header_3),)
                               ],
                             ),
                           ),
                           GestureDetector(
                             behavior: HitTestBehavior.translucent,
                             onTap: ()=>Get.toNamed(InfoUI.routeName),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Icon(Icons.person,size: SizeManager().siz_icon_medium, color: color,),
                                 SizedBox(width: SizeManager().size_padding_large,),
                                 Text("Thông tin cá nhân", style: TextStyle(color: color, fontSize: SizeManager().size_header_3),)
                               ],
                             ),
                           ),
                           GestureDetector(
                             behavior: HitTestBehavior.translucent,
                             onTap: ()=>Get.toNamed(LanguageUI.routName),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Icon(Icons.language,size: SizeManager().siz_icon_medium, color: color,),
                                 SizedBox(width: SizeManager().size_padding_large,),
                                 Text("Ngôn ngữ", style: TextStyle(color: color, fontSize: SizeManager().size_header_3),)
                               ],
                             ),
                           ),

                           GestureDetector(
                             behavior: HitTestBehavior.translucent,
                             onTap: ()=>Get.toNamed(UpdateUI.routName),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Icon(Icons.autorenew,size: SizeManager().siz_icon_medium, color: color,),
                                 SizedBox(width: SizeManager().size_padding_large,),
                                 Text("Cập nhập", style: TextStyle(color: color, fontSize: SizeManager().size_header_3),)
                               ],
                             ),
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
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: ()=> signOut(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Đăng xuất", style: TextStyle(color: color),),
                            Icon(Icons.power_settings_new,color: color,)
                          ],
                        ),
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

  void writeDataLocal() {
    SharedPref.instance.setBool(NameSpace().isLogin, false);
  }

  void signOut() {
    writeDataLocal();
    Get.offAllNamed(LoginScreenUI.routName);
  }

}

