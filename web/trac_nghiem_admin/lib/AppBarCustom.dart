import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isTop;
  final bool flexibleSpace;
  AppBarCustom({this.title, this.isTop = false, this.flexibleSpace = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: new IconThemeData(color: Colors.blue),
      title: Text(
        (title != null) ? '$title' : '',
        style: TextStyle(color: Colors.white),
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
