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
              height: MediaQuery.of(context).size.height/10,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(ChonChuDeHocUI.routerName, arguments:  widget.subject.id),
              child:  Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.blue, width: 2)
                  ),
                  child: Center(child: Text("HỌC", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold), ))
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/6,
            ),

            GestureDetector(
              onTap: () => Get.toNamed(ExamUI.routerName, arguments: widget.subject),
              child:  Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.blue, width: 2)
                  ),
                  child: Center(child: Text("THI", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/6,
            ),


            GestureDetector(
              onTap: () => Get.toNamed(ReviewExamUI.routerName,arguments: widget.subject.id),
              child:  Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.blue, width: 2)
                  ),
                  child: Center(child: Text("XEM LẠI BÀI THI", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),textAlign: TextAlign.center,))
              ),
            ),
          ],
        ),
    );
  }
}
