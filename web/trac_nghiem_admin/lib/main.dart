
import 'dart:html';

import 'package:file_picker_platform_interface/file_picker_platform_interface.dart';
import 'package:file_picker_web/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trac_nghiem_admin/router_manager.dart';
import 'package:trac_nghiem_admin/ui/home/home_ui.dart';
import 'package:trac_nghiem_admin/ui/login/login_screen.dart';


void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
//        home: MyApp(),
      initialRoute: LoginScreenUI.routName,
      getPages: RouterManager.router(),
//      supportedLocales: [const Locale('en'), const Locale('fr')]
    ),
  );
//  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<File> _files = [];

  void _pickFiles() async {
    _files = await FilePicker.getMultiFile() ?? [];
    _files = await FilePicker.getMultiFile(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: _files.isNotEmpty
                    ? ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      Text(_files[index].name),
                  itemCount: _files.length,
                  separatorBuilder: (_, __) => const Divider(
                    thickness: 5.0,
                  ),
                )
                    : Center(
                  child: Text(
                    'Pick some files',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(
                  onPressed: _pickFiles,
                  child: Text('Pick Files'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

