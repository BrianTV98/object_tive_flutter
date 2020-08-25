import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogCauHoiChuaTraLoi extends StatefulWidget {

  String str;


  DialogCauHoiChuaTraLoi(this.str);

  @override
  _DialogCauHoiChuaTraLoiState createState() => _DialogCauHoiChuaTraLoiState();
}

class _DialogCauHoiChuaTraLoiState extends State<DialogCauHoiChuaTraLoi> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
              child: Text("Cảnh báo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),)
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text("Bạn chưa trả lời các câu hỏi ${widget.str}"),
                SizedBox(height: 10,),
                Text("Bạn có chắc chắn muốn nộp bài không?",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                child: Text("Quay lại"),
                onPressed: ()=>Get.back(result: false),
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                child: Text("Nộp bài", style: TextStyle(color: Colors.white),),
                color: Colors.red.withOpacity(0.9),
                onPressed: ()=>Get.back(result: true),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
