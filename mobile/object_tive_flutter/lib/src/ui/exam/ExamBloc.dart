import 'dart:async';

import 'package:get/get.dart';
import 'package:object_tive_test/src/data/local/share_pref.dart';
import 'package:object_tive_test/src/data/models/DetailExam.dart';
import 'package:object_tive_test/src/data/models/Exam.dart';
import 'package:object_tive_test/src/data/models/Question.dart';
import 'package:object_tive_test/src/data/remote/respone/app_respone.dart';
import 'package:object_tive_test/src/ui/home/home_ui.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/prerence_namespace.dart';

class ExamBloc extends BaseBloc{
  StreamController<List<DetailExam>> _questionController =  StreamController<List<DetailExam>>.broadcast();
  StreamSink<List<DetailExam>> get questionSink => _questionController.sink;
  Stream<List<DetailExam>> get questionStream => _questionController.stream;
  Future getExam(int idSubject)async{
    String userName =SharedPref.instance.getString(NameSpace().userName);
    List<DetailExam> result =  await AppResponse().getExam(idSubject,userName);
    if(result==null) {
      Get.offAllNamed(HomeUI.routName);
      Get.snackbar("Lỗi", "Lỗi server");
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

  void updateKetQuaThi(List<Exam> listExam)  async {
      bool result =  await AppResponse().updateResult(listExam);
      if(result==true) Get.snackbar("Thông báo", "Đồng bộ dữ liệu thi thành công");
      else Get.snackbar("Thông báo", "Đồng bộ dữ liệu thất bại");
  }
}