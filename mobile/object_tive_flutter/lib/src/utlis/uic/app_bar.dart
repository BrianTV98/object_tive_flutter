import 'package:flutter/material.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget{
  final String title;
  final bool isTop;
  final bool flexibleSpace;
  AppBarCustom({this.title, this.isTop = false, this.flexibleSpace = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: new IconThemeData(color: Colors.white),
      title: Text(
        (title != null) ? '$title' : '',
        style: TextStyle(fontSize: SizeManager().size_header_3,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      brightness: Brightness.light,
      flexibleSpace: (flexibleSpace)
          ? Container(
//        decoration: CustomTextStyles().boxDecorationTitleDefault,
      )
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
