import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/data/models/Subject.dart';
import 'package:object_tive_test/src/ui/chonchudehoc/ChonChuDeHocUI.dart';
import 'package:object_tive_test/src/ui/exam/ExamUI.dart';
import 'package:object_tive_test/src/ui/review/ReviewExamUI.dart';

class ChucNangUI extends StatefulWidget {
  static String routerName ="/ChucNangUI";

  Subject subject = Get.arguments as Subject;
  @override
  _ChucNangUIState createState() => _ChucNangUIState();
}

class _ChucNangUIState extends State<ChucNangUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/5,
            ),
            RaisedButton(
              onPressed: () => Get.toNamed(ChonChuDeHocUI.routerName, arguments:  widget.subject.id),
              color: Colors.red,
              child:  Text("HỌC", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/5,
            ),
            RaisedButton(
              onPressed: ()=> Get.toNamed(ExamUI.routerName, arguments: widget.subject),
              color: Colors.red,
              child: Text("THI", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/5,
            ),
            RaisedButton(
              onPressed: ()=>Get.toNamed(ReviewExamUI.routerName,arguments: widget.subject.id),
              color: Colors.red,
              child: Text("XEM LẠI BÀI THI", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
    );
  }
}
