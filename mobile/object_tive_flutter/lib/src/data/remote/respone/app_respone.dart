import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:object_tive_test/src/data/local/app_database.dart';
import 'package:object_tive_test/src/data/local/dao/entity/User.dart';
import 'package:object_tive_test/src/data/models/DetailExam.dart';
import 'package:object_tive_test/src/data/models/Exam.dart';
import 'package:object_tive_test/src/data/models/Question.dart';
import 'package:object_tive_test/src/data/models/ReviewExam.dart';
import 'package:object_tive_test/src/data/models/Subject.dart';
import 'package:object_tive_test/src/data/models/Theme.dart';
import 'package:object_tive_test/src/data/models/User.dart';
import 'package:object_tive_test/src/data/models/result_respone.dart';
import 'package:object_tive_test/src/data/remote/api_helper.dart';

class AppResponse{

  static final AppResponse _instance = AppResponse._();

  factory AppResponse(){
    return _instance;
  }

  AppResponse._();

  Future<User> login(String userName,String password, {String token = ""}) async{
    String url = baseUrl +"api/account/Login";
    Map<String, dynamic> param = Map();
    param.putIfAbsent("username", () => userName);
    param.putIfAbsent("password", () => password);

      String jsons = await HttpRequest.instance.postAsync(url, param);
        if (jsons != null) {
          var data = jsonDecode(jsons);
          User result = User.fromJson(data);
          return result;
        }
        else
          return null;

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


  Future<List<Subject>> listSubject() async{
    String url = baseUrl +"api/subject/ListSubject";

    String jsons = await HttpRequest.instance.getAsync(url);
    if (jsons != null) {
      var data = jsonDecode(jsons) as List;
      List<Subject> result =List<Subject>();
      if(data!=null){
        data.forEach((element) {
          result.add(Subject.fromJson(element));
        });
      }
      return result;
    }
    else
      return null;
  }

  Future<List<DetailExam>> getExam(int idSubject, String userName) async{
    String url = baseUrl +"api/question/getExam/$idSubject/$userName";

    String jsons = await HttpRequest.instance.getAsync(url);
    if (jsons != null) {
      var data = jsonDecode(jsons) as List;
      List<DetailExam> result =List<DetailExam>();
      if(data!=null){
        data.forEach((element) {
          result.add(DetailExam.fromJson(element));
        });
        return result;
      }
      return null;
    }
    else
      return null;
  }

  Future<bool> updateResult(List<Exam> listExam) async {
    String url = baseUrl +"api/question/upDateExample";


    String jsons = await HttpRequest.instance.postCustomAsync(url,listExam.map((e) => e.toJson()).toList());
    if (jsons != null) {
      var data = jsonDecode(jsons)  as List;
      if(data!=null){
         return true;
      }
      return false;
    }
    else
      return false;
  }

  Future<List<ReviewExam>> getReviewExam(int idSubject, String userName) async{
      String url = baseUrl +"api/question/reviewExam/$idSubject/$userName";

      String jsons = await HttpRequest.instance.getAsync(url);
      
      List<ReviewExam> list = List<ReviewExam>();
      if (jsons != null) {
        var data = jsonDecode(jsons)  as List;
        if(data!=null){
            data.forEach((element) { 
                list.add(ReviewExam.fromJson(element));
            });
      }
        return list;
      }
      else
        return null;
  }

  Future<List<Themes>> getListTheme(int idSubject) async{
    String url = baseUrl +"api/subject/ListTheme/$idSubject";
    String jsons = await HttpRequest.instance.getAsync(url);
    if (jsons != null) {
      var data = jsonDecode(jsons) as List;
      List<Themes> result =List<Themes>();
      if(data!=null){
        data.forEach((element) {
          result.add(Themes.fromJson(element));
        });
      }
      return result;
    }
    else
      return null;
  }


}