import 'package:flutter/material.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/widget/app_bar.dart';

class LanguageUI extends StatefulWidget {
  @override
  _LanguageUIState createState() => _LanguageUIState();
}

class _LanguageUIState extends State<LanguageUI> {
  String dropdownValue = 'English';

  List <String> spinnerItems = [
    'English',
    'VietNamese',
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Column(
        children: [
          Image.asset(ImageManager().iconLanguage,fit: BoxFit.fitWidth,),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text("Chọn ngôn ngữ phù hợp với bạn."),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_up),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.red, fontSize: 18),

            onChanged: (String data) {
              setState(() {
                dropdownValue = data;
              });
            },
            items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
