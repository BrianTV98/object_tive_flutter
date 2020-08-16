import 'package:flutter/material.dart';
import 'package:trac_nghiem_admin/ui/setting/Setting_UI.dart';

class HomeUI extends StatefulWidget {
  static String routName = "/HomeUI";

  @override
  _HomeUIState createState() => _HomeUIState();
}


class _HomeUIState extends State<HomeUI> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.blue),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
      ),
      drawer: Drawer(
        child: SettingUI(),
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            "QUẢN LÝ CÂU HỎI TRẮC NGHIỆM",
            style: TextStyle(
                fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
          )),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Môn Học',
                      hintStyle: TextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                ),
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Chủ đề',
                      hintStyle: TextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                ),
              ),
              RaisedButton(
                onPressed: (){

                },
                child: Text(
                  "Tìm kiếm"
                ),
              )
            ],
          ),
          DataTable(
            columns: [
              DataColumn(
                label: Text("username"),
              ),
              DataColumn(
                label: Text("Passwod"),
              )
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text("Tran Hieu GlPk"), showEditIcon: true),
                  DataCell(Text("ACDF"))
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("Tran Hieu GlPk")),
                  DataCell(Text("ACDF"))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
