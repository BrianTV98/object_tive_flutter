import 'dart:async';

import 'package:get/get.dart';
import 'package:trac_nghiem_admin/data/app_respone.dart';
import 'package:trac_nghiem_admin/data/model/Question.dart';
import 'package:trac_nghiem_admin/data/model/Subject.dart';
import 'package:trac_nghiem_admin/data/model/Theme.dart';
import 'package:trac_nghiem_admin/utils/base_bloc.dart';

class HomeBloc extends BaseBloc{
    StreamController<List<Subject>> _subjectController =  StreamController<List<Subject>>.broadcast();
    StreamSink<List<Subject>> get subjectSink => _subjectController.sink;
    Stream<List<Subject>> get subjectStream => _subjectController.stream;

  StreamController<List<Themes>> _themesController =  StreamController<List<Themes>>.broadcast();
  StreamSink<List<Themes>> get themeSink => _themesController.sink;
  Stream<List<Themes>> get themeStream => _themesController.stream;

  StreamController<List<Question>> questionController =  StreamController<List<Question>>.broadcast();
  StreamSink<List<Question>> get questionSink => questionController.sink;
  Stream<List<Question>> get questionStream => questionController.stream;

  Future getListSubject()async{
      List<Subject> result =  await AppResponse().listSubject();
      _subjectController.sink.add(result);
  }

  Future getListThemes(String id)async{
    List<Themes> result =  await AppResponse().listTheme(id);
    if(result!=null){
      _themesController.sink.add(result);
    }
    else  _themesController.sink.add(List<Themes>()..add(Themes()));

  }
  Future getListQuestion(String idSubject,String idThemes)async{
    if(idThemes!=null){
      List<Question> result =  await AppResponse().listQuestion(idThemes);
      questionController.sink.add(result);
    }
    else{
      if(idSubject!=null){
        List<Question> result =  await AppResponse().listQuestionFollowSubject(idSubject);
        questionController.sink.add(result);
      }
    }
  }

  Future<bool> deleteQuestion(String idQuestion)async{
    bool result =  await AppResponse().deleteQuestion(idQuestion);
    return result;
  }

  Future<bool> updateQuestion(Question question)async{
    Question result =  await AppResponse().updateQuestion(question);
    if(result!=null) return true;
    else return false;
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _subjectController.close();
    _themesController.close();
    questionController.close();
    super.dispose();
  }

}
