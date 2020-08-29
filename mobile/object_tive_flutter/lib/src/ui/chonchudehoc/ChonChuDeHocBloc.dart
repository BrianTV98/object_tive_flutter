import 'dart:async';

import 'package:flutter/material.dart';
import 'package:object_tive_test/src/data/local/share_pref.dart';
import 'package:object_tive_test/src/data/models/Theme.dart';
import 'package:object_tive_test/src/data/remote/respone/app_respone.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/prerence_namespace.dart';

class ChonChuDeHocBloc extends BaseBloc{
  StreamController<List<Themes>> _themesController =  StreamController<List<Themes>>.broadcast();
  StreamSink<List<Themes>> get themesSink => _themesController.sink;
  Stream<List<Themes>> get themesStream => _themesController.stream;
  Future getListTheme(int idSubject)async{
    String username = SharedPref.instance.getString(NameSpace().userName);
    List<Themes> result =  await AppResponse().getListThemePercentLearning(idSubject,username);
    themesSink.add(result);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _themesController.close();
    super.dispose();
  }
}