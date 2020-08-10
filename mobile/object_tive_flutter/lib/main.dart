import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/ui/home/home_bloc.dart';
import 'package:object_tive_test/src/ui/home/home_ui.dart';
import 'package:object_tive_test/src/ui/users/forgot/forgot_password_ui.dart';
import 'package:object_tive_test/src/ui/users/language/language_ui.dart';
import 'package:object_tive_test/src/ui/users/login/login_2_ui.dart';
import 'package:object_tive_test/src/ui/users/login/login_ui.dart';
import 'package:object_tive_test/src/ui/users/register/register_ui.dart';
import 'package:object_tive_test/src/ui/users/resetpassword/reset_password_ui.dart';
import 'package:object_tive_test/src/ui/users/update/update_ui.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
      home:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

   final Map<int, Color> colorCodes = {
    50: Color.fromRGBO(42, 112, 146, .1),
    100: Color.fromRGBO(42, 112, 146, .2),
    200: Color.fromRGBO(42, 112, 146, .3),
    300: Color.fromRGBO(42, 112, 146, .4),
    400: Color.fromRGBO(42, 112, 146, .5),
    500: Color.fromRGBO(42, 112, 146, .6),
    600: Color.fromRGBO(42, 112, 146, .7),
    700: Color.fromRGBO(42, 112, 146, .8),
    800: Color.fromRGBO(42, 112, 146, .9),
    900: Color.fromRGBO(42, 112, 146, 1),
  };
  @override
  Widget build(BuildContext context) {
    MaterialColor color = MaterialColor(0xff2A7092,colorCodes);
    return MaterialApp(
      title: 'Phần mềm thi Trắc nghiệm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: color,
        primaryColor: color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UpdateUI(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr')
      ],
    );
  }
}


