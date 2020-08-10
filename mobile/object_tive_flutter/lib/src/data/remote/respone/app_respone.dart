import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:object_tive_test/src/data/local/app_database.dart';
import 'package:object_tive_test/src/data/models/result_respone.dart';
import 'package:object_tive_test/src/data/remote/api_helper.dart';

class AppResponse{

  Future<bool> login(String userName,String password, {String token = ""}) async{
    String url = baseUrl +"api/account/Login";
    Map<String, dynamic> param = Map();
    param.putIfAbsent("username", () => userName);
    param.putIfAbsent("password", () => password);

      String jsons = await HttpRequest.instance.postAsync(url, param);
      try {
        if (jsons != null) {
          var data = jsonDecode(jsons);
          ResultResponse result = ResultResponse.fromJson(data);
          return true;
        }
        else
          return false;
      }
      catch(e){
        print("Loi");
        return false;
      }
  }

}