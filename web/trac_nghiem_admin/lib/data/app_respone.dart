import 'dart:convert';

import 'package:trac_nghiem_admin/data/api_helper.dart';
import 'package:trac_nghiem_admin/data/model/Question.dart';
import 'package:trac_nghiem_admin/data/model/Subject.dart';
import 'package:trac_nghiem_admin/data/model/Theme.dart';
import 'package:trac_nghiem_admin/data/model/User.dart';
import 'package:trac_nghiem_admin/data/model/result_respone.dart';
String baseUrl = "http://172.168.76.85:8000/";
//String baseUrl = "http://192.168.1.114:8000/";
String token ="";
String autherUserName="hieu";
String autherPassWord ="123";

class AppResponse{

  static final AppResponse _instance = AppResponse._();

  factory AppResponse(){
    return _instance;
  }

  AppResponse._();

  Future<bool> login(String userName,String password, {String token = ""}) async{
    String url = baseUrl +"api/account/Login";

//    final http.Response response = await http.post(
//      'http://192.168.1.99:8000/api/account/Login',
//      headers: {
//        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
////        "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
//        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
//        "Access-Control-Allow-Methods": "POST, OPTIONS",
//      },
//
//      body: jsonEncode(<String, String>{
//        'username': userName,
//        'password': password
//      }),
//    );
//    if (response.statusCode == 201) {
//      // If the server did return a 201 CREATED response,
//      // then parse the JSON.
//       var a =ResultResponse.fromJson(json.decode(response.body));
//       return true;
//    } else {
//      // If the server did not return a 201 CREATED response,
//      // then throw an exception.
//      throw Exception('Failed to load album');
//    }


    Map<String, dynamic> param = Map();
    param.putIfAbsent("username", () => userName);
    param.putIfAbsent("password", () => password);

    String jsons = await HttpRequest.instance.postAsync(url, param);
    if (jsons != null) {
      var data = jsonDecode(jsons);
      User result = User.fromJson(data);

      return result.isAdmin;
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

  Future<List<Themes>> listTheme(String id) async{
    String url = baseUrl +"api/subject/ListTheme/$id";

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

  Future<List<Question>> listQuestion(String id) async{
    String url = baseUrl +"api/question/getQuestionFollowIdThemes/$id";

    String jsons = await HttpRequest.instance.getAsync(url);
    if (jsons != null) {
      var data = jsonDecode(jsons) as List;
      List<Question> result =List<Question>();
      if(data!=null){
        data.forEach((element) {
            result.add(Question.fromJson(element));
        });
      }
      return result;
    }
    else
      return null;
  }

  Future<List<Question>> listQuestionFollowSubject(String idSubject) async{
    String url = baseUrl +"api/question/getQuestionFollowIdSubject/$idSubject";

    String jsons = await HttpRequest.instance.getAsync(url);
    if (jsons != null) {
      var data = jsonDecode(jsons) as List;
      List<Question> result =List<Question>();
      if(data!=null){
        data.forEach((element) {
          result.add(Question.fromJson(element));
        });
      }
      return result;
    }
    else
      return null;
  }

  Future<bool> deleteQuestion(String idQuestion) async{
    String url = baseUrl +"api/question/deleteQuestion/$idQuestion";

    String jsons = await HttpRequest.instance.getAsync(url);
    if (jsons != null) {
      var data = jsonDecode(jsons) as bool;

      return data;
    }
    else
      return false;
  }

  Future<Question> updateQuestion(Question question) async{
    String url = baseUrl +"api/question/updateQuestion";

    Map<String,dynamic> param = Map();
    param.putIfAbsent("id", () => question.id);
    param.putIfAbsent("idTheme", () => question.idTheme);
    param.putIfAbsent("idLevel", () => question.idLevel);
    param.putIfAbsent("question", () => question.question);
    param.putIfAbsent("a", () => question.a);
    param.putIfAbsent("b", () => question.b);
    param.putIfAbsent("c", () => question.c);
    param.putIfAbsent("d", () => question.d);
    param.putIfAbsent("correct", () => question.correct);
    param.putIfAbsent("explain", () => question.explain);

    String jsons = await HttpRequest.instance.postAsync(url,param);
    if (jsons != null) {
      var data = jsonDecode(jsons);

      Question result = Question.fromJson(data);

      return result;
    }
    else
      return null;
  }


  Future<List<Question>> insertQuestion(List<Question> questions) async{
    String url = baseUrl +"api/question/createQuestion";


    String jsons = await HttpRequest.instance.postCustomAsync(url,questions.map((e) => e.toJson()).toList());
    if (jsons != null) {
      var data = jsonDecode(jsons) as List;
      List<Question> result= List<Question>();
      if(data!=null){
          data.forEach((element) {
            result= element.fromJson(data);
          });
      }

      return result;
    }
    else
      return null;
  }
}