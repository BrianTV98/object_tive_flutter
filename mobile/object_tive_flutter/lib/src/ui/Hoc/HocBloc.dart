import 'dart:async';

import 'package:object_tive_test/src/data/local/share_pref.dart';
import 'package:object_tive_test/src/data/models/LearningProcess.dart';
import 'package:object_tive_test/src/data/remote/respone/app_respone.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/prerence_namespace.dart';

class HocBloc extends BaseBloc{
  StreamController<List<LearningProcess>> _learningProcessController =  StreamController<List<LearningProcess>>.broadcast();
  StreamSink<List<LearningProcess>> get learningProcessSink => _learningProcessController.sink;
  Stream<List<LearningProcess>> get learningProcessStream => _learningProcessController.stream;

  Future getListLearningProcess(int idThemes)async{
    List<LearningProcess> result =  await AppResponse().getListLearningProcess(idThemes, SharedPref.instance.getString(NameSpace().userName));
    _learningProcessController.sink.add(result);
  }

  @override
  void dispose() {
    // TODO: implement dispo8se
    _learningProcessController.close();
    super.dispose();
  }
}