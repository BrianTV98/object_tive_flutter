import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:object_tive_test/src/data/local/app_database.dart';
import 'package:object_tive_test/src/data/models/result_respone.dart';
import 'package:object_tive_test/src/data/remote/api_helper.dart';

class AppResponse{

  static final AppResponse _instance = AppResponse._();

  factory AppResponse(){
    return _instance;
  }

  AppResponse._();

  Future<bool> login(String userName,String password, {String token = ""}) async{
    String url = baseUrl +"api/account/Login";
    Map<String, dynamic> param = Map();
    param.putIfAbsent("username", () => userName);
    param.putIfAbsent("password", () => password);

      String jsons = await HttpRequest.instance.postAsync(url, param);
        if (jsons != null) {
          var data = jsonDecode(jsons);
          ResultResponse result = ResultResponse.fromJson(data);
          return result.states;
        }
        else
          return false;

  }

  Future<bool> register(String userName, String fullName, String email,String phoneNumber, DateTime birthday, String password) async{
    String url = baseUrl +"api/account/createAccount";
    Map<String, dynamic> param = Map();
    param.putIfAbsent("username", () => userName);
    param.putIfAbsent("fullName", () => fullName);
    param.putIfAbsent("email", () => email);
    param.putIfAbsent("phoneNumber", () => phoneNumber);
    param.putIfAbsent("birthday", () => birthday.toIso8601String());
    param.putIfAbsent("password", () => password);


    String jsons = await HttpRequest.instance.postAsync(url, param);
    if (jsons != null) {
      var data = jsonDecode(jsons);
      ResultResponse result = ResultResponse.fromJson(data);
      return result.states;
    }
    else
      return false;

  }

}