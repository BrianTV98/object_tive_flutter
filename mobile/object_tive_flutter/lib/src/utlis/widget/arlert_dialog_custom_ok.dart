import 'dart:core';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';

class AlertDialogCustomOK extends StatefulWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;

  AlertDialogCustomOK(
      {this.title,this.textColor, this.backgroundColor});

  @override
  _AlertDialogCustomOKState createState() => _AlertDialogCustomOKState();
}

class _AlertDialogCustomOKState extends State<AlertDialogCustomOK> {
  final Color color = ThemeData().primaryColor;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: widget.backgroundColor??color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: SizeManager().size_padding_default),
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? color ,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(widget.title, style: TextStyle(color: widget.textColor, fontSize: SizeManager().size_header_3, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: SizeManager().size_padding_default),
            child: GestureDetector(
              onTap: ()=> Get.back(),
                child: Text("OK", style: TextStyle( color: widget.textColor),))
          )
        ],
      ),
    );
  }
}
