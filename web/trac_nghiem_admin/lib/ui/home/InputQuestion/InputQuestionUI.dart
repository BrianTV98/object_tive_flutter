
import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:excel/excel.dart' as ex;

import 'package:file_picker_platform_interface/file_picker_platform_interface.dart';
import 'package:file_picker_web/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trac_nghiem_admin/AppBarCustom.dart';
import 'package:trac_nghiem_admin/DisableGlowListViewCustom.dart';
import 'package:trac_nghiem_admin/data/model/Question.dart';
import 'package:trac_nghiem_admin/data/model/Subject.dart';
import 'package:trac_nghiem_admin/data/model/Theme.dart';
import 'package:trac_nghiem_admin/ui/home/EditQuestion/edit_question_ui.dart';
import 'package:trac_nghiem_admin/ui/home/InputQuestion/AddNewQuestion/add_new_question_ui.dart';
import 'package:trac_nghiem_admin/ui/home/InputQuestion/InputQuestionBloc.dart';
import 'package:trac_nghiem_admin/ui/login/login_bloc.dart';
import 'package:trac_nghiem_admin/ui/setting/Setting_UI.dart';
import 'package:trac_nghiem_admin/utils/base_bloc.dart';

class InputQuestionUI extends StatefulWidget {
  static String routerName = "/InputQuestionUI";

  @override
  _InputQuestionUIState createState() => _InputQuestionUIState();
}

class _InputQuestionUIState extends State<InputQuestionUI> {
  InputQuestionBloc _inputQuestionBloc;
  List<Subject> _listSubject;
  String _selectedSubject;
  String _selectedSubjectId;

  List<Themes> _listTheme;
  String _selectedThemes;

  int indexRang = 0;

  String _selectedThemeId;
  List<Question> _listQuestion = List<Question>();

  List<int> _selectedFile;
  Uint8List _bytesData;

  String _nameFile;

  @override
  void initState() {
    // TODO: implement initState
    _inputQuestionBloc = BlocProvider.of<InputQuestionBloc>(context);
    _inputQuestionBloc.getListSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarCustom(
      ),
      drawer: Drawer(
        child: SettingUI(),
      ),
      body: SafeArea(

        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
                  "THÊM CÂU HỎI TRẮC NGHIỆM",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StreamBuilder<List<Subject>>(
                  stream: _inputQuestionBloc.subjectStream,
                  builder: (context, snapshot) {
                    _listSubject = snapshot.data;
                    return Material(
                      child: Container(
                        height: 50,
                        width: 200,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 16),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                          hint: Text("Môn Học"),
                          value: _selectedSubject,
                          items: (_listSubject != null)
                              ? _listSubject.map((Subject value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: new Text(
                                value.name,
                                style: TextStyle(color: Colors.blue),
                              ),
                            );
                          }).toList()
                              : <Subject>[].map((Subject value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: new Text(
                                value.name,
                                style: TextStyle(color: Colors.blue),
                              ),
                            );
                          }).toList(),
                          onChanged: (String _tmp) {
                            Subject item = _listSubject
                                .firstWhere((element) => element.name == _tmp);
                            setState(() {
                              _selectedSubject = _tmp;
                              _selectedSubjectId = item.id.toString();
                              _inputQuestionBloc
                                  .getListThemes(item.id.toString());
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                StreamBuilder<List<Themes>>(
                  stream: _inputQuestionBloc.themeStream,
                  builder: (context, snapshot) {
                    _listTheme = snapshot.data;
                    return Material(
                      child: Container(
                        height: 50,
                        width: 200,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 16),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                          hint: Text("Chủ đề"),
                          value: _selectedThemes,
                          items: (_listTheme != null)
                              ? _listTheme.map((Themes value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: new Text(
                                value.name,
                                style: TextStyle(color: Colors.blue),
                              ),
                            );
                          }).toList()
                              : <Themes>[].map((Themes value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: new Text(
                                value.name,
                                style: TextStyle(color: Colors.blue),
                              ),
                            );
                          }).toList(),
                          onChanged: (String tmp) {
                            setState(() {
                              _selectedThemes = tmp;
                              Themes item = _listTheme
                                  .firstWhere((element) => element.name == tmp);
                              _selectedThemeId = item.id.toString();
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 80,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: () =>
                      showAddQuestionDialog(_selectedSubjectId, _selectedThemeId),
                  child: Text("Nhập thủ công"),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: pickFileExel,
                  child: Text("Chọn file Exel"),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: (_selectedFile!=null)?loadExecl:null,
                  child: Row(
                    children: [
                      Text("Upload từ file"),
                      Text(" ${_nameFile??""}", style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                )
              ],
            ),
            if (_listQuestion.length != 0) ...[
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 2 / 3,
                child: ScrollConfiguration(
                  behavior: DisableGlowListViewCustom(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: MediaQuery
                              .of(context)
                              .size
                              .width),
                      child: DataTable(
                          columnSpacing: 0,
                          columns: [
                            DataColumn(
                              label: Text("Số TT"),
                            ),
                            DataColumn(
                              label: Text("Câu Hỏi"),
                            ),
                            DataColumn(
                              label: Text("Đáp án A"),
                            ),
                            DataColumn(
                              label: Text("Đáp án B"),
                            ),
                            DataColumn(
                              label: Text("Đáp án C"),
                            ),
                            DataColumn(
                              label: Text("Đáp án D"),
                            ),
                            DataColumn(
                              label: Text("Đ.A Đúng"),
                            ),
                            DataColumn(
                              label: Text("Chú giải"),
                            ),
                            DataColumn(
                              label: Text("Độ khó"),
                            ),
                            DataColumn(
                              label: Text(""),
                            ),
                            DataColumn(
                              label: Text(""),
                            )
                          ],
                          rows: _listQuestion
                              .asMap()
                              .entries
                              .map((element) =>
                              DataRow(
                                cells: <DataCell>[
                                  //Extracting from Map element the value
                                  DataCell(
                                      Container(
                                          width:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width * 1 / 80,
                                          child: Text("${element.key}"))),
                                  DataCell(Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width * 2 / 14,
                                      child: Text(element.value.question ?? ""))),
                                  DataCell(Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 14,
                                      child: Text(element.value.a ?? ""))),
                                  DataCell(Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 14,
                                      child: Text(element.value.b ?? ""))
                                  ),
                                  DataCell(
                                      Container(
                                          width:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width / 14,
                                          child: Text(element.value.c ?? ""))
                                  ),
                                  DataCell(Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 14,
                                      child: Text(element.value.d ?? ""))),
                                  DataCell(Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 20,
                                      child: Text(element.value.correct ?? ""))),
                                  DataCell(Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width * 2 / 14,
                                      child: Text(element.value.explain ?? ""))),
                                  DataCell(Container(
                                      width:50,
                                      child: (element.value.idLevel!=null) ?Text(levelToString(element.value.idLevel)):Text(""))),
                                  DataCell(Container(
                                    width: 50,
                                    child: IconButton(
                                      icon: Icon(Icons.edit, color: Colors.blue,),
                                      onPressed: () =>
                                          showEditDialog(
                                              element.key, element.value),
                                    ),
                                  )
                                  ),
                                  DataCell(Container(
                                    width: 50,
                                    child: IconButton(
                                        onPressed: () =>
                                            showYesNoDialog(element.value.id),
                                        icon: Icon(
                                          Icons.delete, color: Colors.blue,)),
                                  )),
                                ],
                              )).toList()
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: () => checkInsertQuestion(),
                    color: Colors.red,
                    child: Row(
                      children: [
                        Text("Upload", style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.cloud_upload, color: Colors.white,)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              )
            ],
            
            if(_listQuestion.length==0)...[
              SizedBox(height: 100,),
              Image.asset('assets/images/add_question.jpg', height: 300,)
            ]
          ],
        ),
      ),
    );
  }

  Future showAddQuestionDialog(String idSubject, String idLevel) async {
    if (_selectedSubjectId == null || _selectedThemeId == null) {
      showInfoDialog();
      return;
    }
    if (_listQuestion.length != 0) {
      setState(() {
        indexRang = _listQuestion[_listQuestion.length - 1].id + 1;
      });
    }
    List<Question> result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddNewQuestionUI(indexRang, idSubject, idLevel);
        }) as List<Question>;

    setState(() {
      if (result != null) {
        _listQuestion.addAll(result);
      }
    });
  }

  Future showInfoDialog() async {
    int check = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Cảnh báo"),
            content: Text("Bạn phải chọn môn học và chủ đề trước!!"),
            actions: [
              RaisedButton(
                child: Text("OK"),
                onPressed: () => Get.back(),
              ),
            ],
          );
        });
  }

  Future showYesNoDialog(int idQuestion) async {
    int check = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Cảnh báo"),
            content: Text("Bạn có thực sự muốn xóa câu hỏi này"),
            actions: [
              RaisedButton(
                child: Text("Yes"),
                onPressed: () => Get.back(result: 1),
              ),
              RaisedButton(
                child: Text("No"),
                onPressed: () => Get.back(result: 0),
              )
            ],
          );
        }
    );
    if (check == 1) {
      setState(() {
        _listQuestion.removeWhere((element) => element.id == idQuestion);
      });
    }
  }

  Future showEditDialog(int indexQuestion, Question question) async {
    var result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return EditQuestionUI(question);
        }
    );

    if (result != null) {
      setState(() {
        _listQuestion.replaceRange(indexQuestion, indexQuestion + 1,
            new List<Question>()..add(result));
      });
    }
  }



  Future loadExecl() async {

      var excel = ex.Excel.decodeBytes(_selectedFile);
      int i = 0;
      List<dynamic> keys = new List<dynamic>();
      List<Map<String, dynamic>> json = new List<Map<String, dynamic>>();
      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table].rows) {
          if (i == 0) {
            List<String> tmpList = row.map((s) => s as String).toList();

            keys = tmpList;
            i++;
          } else {
            Map<String, dynamic> temp = Map<String, dynamic>();
            int j = 0;
            String tk = '';
            for (var key in keys) {
              tk=key;
              temp[tk] = (row[j].runtimeType == String)
                    ? row[j].toString()
                  : row[j];
              j++;
            }
            json.add(temp);
          }
        }
      }

      // xu ly load file
      List<Question> question = List<Question>();
      int index;
      if(_listQuestion.length!=0) index =_listQuestion[_listQuestion.length-1].id;
      else index =0;
      json.forEach((element) {
        Question tmp=Question.fromJson(element);
        // xu ly trung id
        tmp.id= index++;
        tmp.usernameSend =userName;
        tmp.idTheme=int.parse(_selectedThemeId);
        question.add(tmp);
      });
      setState(() {
        _listQuestion.addAll(question);
      });



  }



  startWebFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.accept = '.xlsx';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files= uploadInput.files;
      final file = files[0];
      setState(() {
        _nameFile =file.name;
      });
      final reader = new html.FileReader();
      reader.onLoadEnd.listen((e) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);
    });

  }

  void _handleResult(Object result) {
    setState(() {
      _bytesData = Base64Decoder().convert(result.toString().split(",").last);

      _selectedFile = _bytesData;
    });
  }

  Future checkInsertQuestion() async {
    bool  check = await _inputQuestionBloc.insertQuestion(_listQuestion);
    if(check)
      setState(() {
        _listQuestion.clear();
      });
  }
  

  Future pickFileExel() async {
    if(_selectedThemes==null) {
      showInfoDialog();
      return;
    }

    await startWebFilePicker();
  }

  String levelToString(int idLevel) {
    if(idLevel==1) return "Dễ";
    if(idLevel==2) return "TB";
    if(idLevel==3) return "Khó";
  }

}



