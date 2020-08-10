import 'dart:core';

import 'package:flutter/material.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';

class AlertDialogCustomYesNo extends StatefulWidget {
  final String title;
  final String textConfirm;
  final String textCancel;
  final Color textColor;
  final Color backgroundColor;
  final Function functionConfirm;
  final Function functionCancel;


  AlertDialogCustomYesNo(
      {this.title,
      this.textConfirm,
      this.textCancel,
      this.textColor=Colors.white,
      this.backgroundColor ,
      this.functionConfirm,
      this.functionCancel});

  @override
  _AlertDialogCustomYesNoState createState() => _AlertDialogCustomYesNoState();
}

class _AlertDialogCustomYesNoState extends State<AlertDialogCustomYesNo> {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Text(widget.textCancel, style: TextStyle(color: widget.textColor),),
                  onTap: ()=> widget.functionCancel,
                ),
                Container(
                  width: 1,
                  height: SizeManager().size_header_2,
                  color: widget.textColor,
                ),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: ()=> widget.textConfirm,
                    child: Text(widget.textConfirm, style: TextStyle(color: widget.textColor),)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
