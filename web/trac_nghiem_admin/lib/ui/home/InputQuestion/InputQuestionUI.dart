import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trac_nghiem_admin/data/model/Question.dart';
import 'package:trac_nghiem_admin/data/model/Subject.dart';
import 'package:trac_nghiem_admin/data/model/Theme.dart';
import 'package:trac_nghiem_admin/ui/home/EditQuestion/edit_question_ui.dart';
import 'package:trac_nghiem_admin/ui/home/InputQuestion/AddNewQuestion/add_new_question_ui.dart';
import 'package:trac_nghiem_admin/ui/home/InputQuestion/InputQuestionBloc.dart';
import 'package:trac_nghiem_admin/utils/base_bloc.dart';

class InputQuestionUI extends StatefulWidget {
   static String routerName ="/InputQuestionUI";
  @override
  _InputQuestionUIState createState() => _InputQuestionUIState();
}

class _InputQuestionUIState extends State<InputQuestionUI> {

  InputQuestionBloc _inputQuestionBloc;
  List<Subject> _listSubject;
  String _selectedSubject;
  String _selectedSubjectId;

  List<Themes> _listTheme;
  String _selectedThemes ;
  String _selectedThemeId;

  List<Question> _listQuestion;

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
      body:Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
                "THÊM CÂU HỎI TRẮC NGHIỆM",
                style: TextStyle(
                    fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
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
                            _selectedSubjectId=item.id.toString();
                            _inputQuestionBloc.getListThemes(item.id.toString());
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
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25)))
                        ),
                        hint: Text("Chủ đề"),
                        value: _selectedThemes,
                        items:(_listTheme!=null)? _listTheme.map((Themes value) {
                          return  DropdownMenuItem<String>(
                            value: value.name,
                            child: new Text(value.name, style: TextStyle(color: Colors.blue),),
                          );
                        }).toList() :<Themes> [].map((Themes value) {
                          return  DropdownMenuItem<String>(
                            value: value.name,
                            child: new Text(value.name, style: TextStyle(color: Colors.blue),),
                          );
                        }).toList(),
                        onChanged: (String tmp) {
                          setState(() {
                            _selectedThemes  = tmp;
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
//              ButtonTheme(
//                minWidth: 120,
//                height: 20,
//                padding: EdgeInsets.zero,
//                child: RaisedButton(
//                  onPressed: () {
//                    _inputQuestionBloc.getListQuestion(_selectedSubjectId,
//                        _selectedThemeId);
//                  },
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(25))),
//                  child: Padding(
//                    padding: const EdgeInsets.symmetric(vertical: 15),
//                    child: Row(
//                      children: [
//                        Icon(
//                          Icons.search,
//                          color: Colors.white,
//                        ),
//                        Text(
//                          "Tìm kiếm",
//                          style: TextStyle(color: Colors.white),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
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
                onPressed: ()=>showAddQuestionDialog(_selectedSubjectId, _selectedThemeId),
                child: Text(
                  "Nhập thủ công"
                ),
              ),

              SizedBox(
                width: 20,
              ),
              RaisedButton(
                onPressed: (){},
                child: Text(
                    "Upload từ file Exel"
                ),
              ),

              SizedBox(
                width: 100,
              )
            ],
          )
//          Row(
//            children: [
//              Container(
//                width: 200,
//                child: TextFormField(
//                  decoration: InputDecoration(
//                    labelText: "Câu Hỏi",
//                      enabledBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(10),
//                          borderSide: BorderSide(
//                              color: Colors.blue,
//                              width: 1
//                          )
//                      ),
//                    focusedBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                            color: Colors.blue,
//                            width: 1
//                        )
//                    ),
//                  ),
//                ),
//              ),
//              Container(
//                width: 200,
//                child: TextFormField(
//                  decoration: InputDecoration(
//                    labelText: "Đáp án A",
//                    enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                            color: Colors.blue,
//                            width: 1
//                        )
//                    ),
//                    focusedBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                            color: Colors.blue,
//                            width: 1
//                        )
//                    ),
//                  ),
//                ),
//              ),
//              Container(
//                width: 200,
//                child: TextFormField(
//                  decoration: InputDecoration(
//                    labelText: "Đáp án B",
//                    enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                            color: Colors.blue,
//                            width: 1
//                        )
//                    ),
//                    focusedBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                            color: Colors.blue,
//                            width: 1
//                        )
//                    ),
//                  ),
//                ),
//              ),
//              Container(
//                width: 200,
//                child: TextFormField(
//                  decoration: InputDecoration(
//                    labelText: "Đáp án C",
//                    enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                            color: Colors.blue,
//                            width: 1
//                        )
//                    ),
//                    focusedBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                            color: Colors.blue,
//                            width: 1
//                        )
//                    ),
//                  ),
//                ),
//              ),
//              Container(
//                width: 200,
//                child: TextFormField(
//                  decoration: InputDecoration(
//                    labelText: "Đáp án D",
//                    enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                            color: Colors.blue,
//                            width: 1
//                        )
//                    ),
//                    focusedBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                            color: Colors.blue,
//                            width: 1
//                        )
//                    ),
//                  ),
//                ),
//              )
//            ],
//          )
//          StreamBuilder<List<Question>>(
//            stream: _inputQuestionBloc.questionStream,
//            builder: (context, snapshot) {
//              _listQuestion = snapshot.data;
//              if (_listQuestion == null) {
//                return Column(
//                  children: [
//                    SizedBox(
//                      height: 50,
//                    ),
//                    Image.asset("assets/images/search_bg.jpg",
//                        width: MediaQuery.of(context).size.width / 3)
//                  ],
//                );
//              }
//
//              if (_listQuestion.length == 0) {
//                return Column(
//                  children: [
//                    SizedBox(
//                      height: 50,
//                    ),
//                    Image.asset("assets/images/search_bg.jpg",
//                        width: MediaQuery.of(context).size.width / 3)
//                  ],
//                );
//              }
//
//              return Container(
//                height: MediaQuery.of(context).size.height * 2 / 3,
//                child: SingleChildScrollView(
//                  scrollDirection: Axis.vertical,
//                  child: DataTable(
//                    columns: [
//                      DataColumn(
//                        label: Text("id"),
//                      ),
//                      DataColumn(
//                        label: Text("Question"),
//                      ),
//                      DataColumn(
//                        label: Text("A"),
//                      ),
//                      DataColumn(
//                        label: Text("B"),
//                      ),
//                      DataColumn(
//                        label: Text("C"),
//                      ),
//                      DataColumn(
//                        label: Text("D"),
//                      ),
//                      DataColumn(
//                        label: Text("correct"),
//                      ),
//                      DataColumn(
//                        label: Text("explain"),
//                      ),
////                      DataColumn(
////                        label: Text(""),
////                      ),
////                      DataColumn(
////                        label: Text(""),
////                      )
//                    ],
//                    rows:
//                    _listQuestion
//                        .map(
//                      ((element) => DataRow(
//                        cells: <DataCell>[
//                          DataCell(
//                              Text(element?.id.toString() ?? "")),
//                          //Extracting from Map element the value
//                          DataCell(Container(
//                              width: 400,
//                              child:
//                              Text(element?.question ?? ""))),
//                          DataCell(Text(element?.a ?? "")),
//                          DataCell(Text(element?.b ?? "")),
//                          DataCell(Text(element?.c ?? "")),
//                          DataCell(Text(element?.d ?? "")),
//                          DataCell(Text(element?.correct ?? "")),
//                          DataCell(Text(element?.explain ?? "")),
////                          DataCell(IconButton(
////                            icon: Icon(Icons.edit, color: Colors.blue,),
////                            onPressed: ()=>showEditDialog(element),
////                          )
////
////                          ),
////                          DataCell(IconButton(
////                              onPressed: ()=>showYesNoDialog(element.id),
////                              icon: Icon(Icons.delete, color: Colors.blue,))),
//                        ],
//                      )),
//                    )
//                        .toList(),
//                  ),
//                ),
//              );
//            },
//          ),
        ],
      ),
    );
  }

  Future showAddQuestionDialog(String idSubject, String idLevel) async{

    if(_selectedSubjectId==null||_selectedThemeId==null){
      showInfoDialog();
      return;
    }
    var result = await showDialog(
        context: context,
        builder: (BuildContext context){
          return AddNewQuestionUI(idSubject, idLevel);
        }
    );

    if(result!=null){
      bool check= await _inputQuestionBloc.updateQuestion(result);
      if(check==true){
        _inputQuestionBloc.getListQuestion(_selectedSubjectId, _selectedThemeId);
        Get.snackbar("afsdfais", "Update thanh cong");
      }
      else  Get.snackbar("afsdfais", "Update thất bại");

    }
  }
  Future showInfoDialog() async{
    int check = await showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Cảnh báo"),
            content: Text("Bạn phải chọn môn học và chủ đề trước!!"),
            actions: [
              RaisedButton(
                child: Text("OK"),
                onPressed: ()=> Get.back(),
              ),
            ],
          );
        }
    );
  }
}
