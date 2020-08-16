import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trac_nghiem_admin/router_manager.dart';
import 'package:trac_nghiem_admin/ui/home/home_ui.dart';
import 'package:trac_nghiem_admin/ui/login/login_screen.dart';

void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
//        home: MyApp(),
      initialRoute: HomeUI.routName,
      getPages: RouterManager.router(),
//      supportedLocales: [const Locale('en'), const Locale('fr')]
    ),
  );
//  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:LoginScreenUI(),
    );
  }
}
