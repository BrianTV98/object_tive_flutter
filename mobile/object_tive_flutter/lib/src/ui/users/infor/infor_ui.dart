import 'package:flutter/material.dart';
import 'package:object_tive_test/src/utlis/widget/app_bar.dart';

class InfoUI extends StatefulWidget {
  static String  routeName ="InfoUI";
  @override
  _InfoUIState createState() => _InfoUIState();
}

class _InfoUIState extends State<InfoUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(

      ),
      body: Column(
        children: [
          Text("This is Infor Screen"),
        ],
      ),
    );
  }
}
