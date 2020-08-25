import 'dart:async';

import 'package:object_tive_test/src/data/models/Subject.dart';
import 'package:object_tive_test/src/data/remote/respone/app_respone.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';

class HomeBloc extends BaseBloc{
  StreamController<List<Subject>> _subjectController =  StreamController<List<Subject>>.broadcast();
  StreamSink<List<Subject>> get subjectSink => _subjectController.sink;
  Stream<List<Subject>> get subjectStream => _subjectController.stream;
  Future getListSubject()async{
    List<Subject> result =  await AppResponse().listSubject();
    _subjectController.sink.add(result);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectController.close();
    super.dispose();
  }
}

