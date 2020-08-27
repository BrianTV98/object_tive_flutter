import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spinner/spinner.dart';
import 'package:trac_nghiem_admin/data/model/Question.dart';
import 'package:trac_nghiem_admin/data/model/Subject.dart';
import 'package:trac_nghiem_admin/data/model/Theme.dart';
import 'package:trac_nghiem_admin/ui/home/EditQuestion/edit_question_ui.dart';
import 'package:trac_nghiem_admin/ui/home/home_bloc.dart';
import 'package:trac_nghiem_admin/ui/login/login_bloc.dart';
import 'package:trac_nghiem_admin/ui/login/login_screen.dart';
import 'package:trac_nghiem_admin/ui/setting/Setting_UI.dart';
import 'package:trac_nghiem_admin/utils/base_bloc.dart';

class HomeUI extends StatefulWidget {
  static String routName = "/HomeUI";



  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  HomeBloc _homeBloc;
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

    _homeBloc = BlocProvider.of<HomeBloc>(context);
    if(userName ==null) Get.offAllNamed(LoginScreenUI.routName);
    _homeBloc.getListSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.blue),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
      ),
      drawer: Drawer(
        child: SettingUI(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
              child: Text(
            "QUẢN LÝ CÂU HỎI TRẮC NGHIỆM",
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
                stream: _homeBloc.subjectStream,
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
                            _homeBloc.getListThemes(item.id.toString());
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
                stream: _homeBloc.themeStream,
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
              ButtonTheme(
                minWidth: 120,
                height: 20,
                padding: EdgeInsets.zero,
                child: RaisedButton(
                  onPressed: () {
                    _homeBloc.getListQuestion(_selectedSubjectId,
                        _selectedThemeId);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Text(
                          "Tìm kiếm",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 80,
              )
            ],
          ),
          StreamBuilder<List<Question>>(
            stream: _homeBloc.questionStream,
            builder: (context, snapshot) {
              _listQuestion = snapshot.data;
              if (_listQuestion == null) {
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset("assets/images/search_bg.jpg",
                        width: MediaQuery.of(context).size.width / 3)
                  ],
                );
              }

              if (_listQuestion.length == 0) {
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset("assets/images/search_bg.jpg",
                        width: MediaQuery.of(context).size.width / 3)
                  ],
                );
              }

              return Container(
                height: MediaQuery.of(context).size.height * 2 / 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text("STT"),
                      ),
                      DataColumn(
                        label: Text("Câu hỏi"),
                      ),
                      DataColumn(
                        label: Text("A"),
                      ),
                      DataColumn(
                        label: Text("B"),
                      ),
                      DataColumn(
                        label: Text("C"),
                      ),
                      DataColumn(
                        label: Text("D"),
                      ),
                      DataColumn(
                        label: Text("Đ.A"),
                      ),
                      DataColumn(
                        label: Text("Chú giải"),
                      ),
                      DataColumn(
                        label: Text("Mức độ"),
                      ),
                      DataColumn(
                        label: Text(""),
                      ),
                      DataColumn(
                        label: Text(""),
                      )
                    ],
                    rows:
                        _listQuestion.asMap().entries
                            .map(
                              ((element) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                          Text(element?.key.toString() ?? "")),
                                      //Extracting from Map element the value
                                      DataCell(Container(
                                          width: 400,
                                          child:
                                              Text(element.value.question ?? ""))),
                                      DataCell(Text(element.value.a ?? "")),
                                      DataCell(Text(element.value.b ?? "")),
                                      DataCell(Text(element.value.c ?? "")),
                                      DataCell(Text(element.value.d ?? "")),
                                      DataCell(Text(element.value.correct ?? "")),
                                      DataCell(Text(element.value.explain ?? "")),
                                      DataCell(Container(
                                        width: 50,
                                          child: Text(levelToString(element.value.idLevel) ?? ""))),
                                      DataCell(IconButton(
                                        icon: Icon(Icons.edit, color: Colors.blue,),
                                        onPressed: ()=>showEditDialog(element.value),
                                      )),
                                      DataCell(IconButton(
                                          onPressed: ()=>showYesNoDialog(element.value),
                                          icon: Icon(Icons.delete, color: Colors.blue,))),
                                    ],
                                  )),
                            )
                            .toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future showYesNoDialog(Question question) async{

    String username = userName;
    if(username !=question.usernameSend.trim()){
      Get.dialog(ShowDialogNotPermisstion());
      return;
    }

    int check = await showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Cảnh báo"),
            content: Text("Bạn có thực sự muốn xóa câu hỏi này"),
            actions: [
                RaisedButton(
                  child: Text("Yes"),
                  onPressed: ()=> Get.back(result: 1),
                ),
                RaisedButton(
                  child: Text("No"),
                  onPressed: ()=>Get.back(result: 0),
                )
            ],
          );
        }
    );
    if(check==1) {
      bool check2= await _homeBloc.deleteQuestion(question.id.toString());
      if(check2==true) Get.snackbar("Thông báo", "Bạn đã xóa thành công!");
      else Get.snackbar("Thông báo", "Xóa thất bại!");
      _homeBloc.getListQuestion(_selectedSubjectId, _selectedThemeId);
    }
  }

  Future showEditDialog(Question question) async{
    String username = userName;
    if(username !=question.usernameSend.trim()){
        Get.dialog(ShowDialogNotPermisstion());
        return;
    }

    var result = await showDialog(
        context: context,
        builder: (BuildContext context){
          return EditQuestionUI(question);
        }
    );

    if(result!=null){
      bool check= await _homeBloc.updateQuestion(result);
      if(check==true){
        _homeBloc.getListQuestion(_selectedSubjectId, _selectedThemeId);
        Get.snackbar("afsdfais", "Update thanh cong");
      }
      else  Get.snackbar("afsdfais", "Update thất bại");
    }
  }

  String levelToString(int idLevel) {
    if(idLevel==1) return "Dễ";
    if(idLevel==2) return "TB";
    if(idLevel==3) return "Khó";
  }

}
class ShowDialogNotPermisstion extends StatefulWidget {
  @override
  _ShowDialogNotPermisstionState createState() => _ShowDialogNotPermisstionState();
}

class _ShowDialogNotPermisstionState extends State<ShowDialogNotPermisstion> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:Container(
        width: 120,
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("Thông báo", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Flexible(child: Text("Bạn không có quyền chỉnh sửa câu hỏi này.")),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: ()=>Get.back(),
                  child: Text("OK"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
