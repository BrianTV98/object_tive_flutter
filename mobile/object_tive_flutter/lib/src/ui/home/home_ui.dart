import 'package:flutter/material.dart';
import 'package:object_tive_test/src/ui/setting/setting_ui.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/widget/app_bar.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      drawer: Drawer(
        child: SettingUI(),
      ),
      body: Column(
          children: [
            Row(
              children: [

              ],
            )
          ],
      ),
    );
  }
}