import 'dart:async';

import 'package:get/get.dart';
import 'package:object_tive_test/src/data/local/share_pref.dart';
import 'package:object_tive_test/src/data/models/ReviewExam.dart';
import 'package:object_tive_test/src/data/remote/respone/app_respone.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/prerence_namespace.dart';

class ReviewExamBloc extends BaseBloc{
  StreamController<List<ReviewExam>> _questionController =  StreamController<List<ReviewExam>>.broadcast();
  StreamSink<List<ReviewExam>> get questionSink => _questionController.sink;
  Stream<List<ReviewExam>> get questionStream => _questionController.stream;
  Future getReviewExam(int idSubject)async{
    String userName =SharedPref.instance.getString(NameSpace().userName);
    List<ReviewExam> result =  await AppResponse().getReviewExam(idSubject,userName);
    if(result==null) {
      Get.snackbar("Lỗi", "Bạn chưa thi");
      return;
    }
    _questionController.sink.add(result);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _questionController.close();
    super.dispose();
  }

}