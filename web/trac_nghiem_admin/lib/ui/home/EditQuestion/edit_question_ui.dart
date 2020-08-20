import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trac_nghiem_admin/data/model/Question.dart';

class EditQuestionUI extends StatefulWidget {
  static const String routerName = "/EditQuestionUI";

  Question _question;


  EditQuestionUI(this._question);

  @override
  _EditQuestionUIState createState() => _EditQuestionUIState();
}

class _EditQuestionUIState extends State<EditQuestionUI> {
  TextEditingController _questionController = TextEditingController();
  TextEditingController _aAnswerController = TextEditingController();
  TextEditingController _bAnswerController = TextEditingController();
  TextEditingController _cAnswerController = TextEditingController();
  TextEditingController _dAnswerController = TextEditingController();
  TextEditingController _explainAnswerController = TextEditingController();

  List<String> _listAnswer =["A","B","C","D"];
  String _selectedAnswerCorrect ;

  String _selectedLevel;
  List<String> _listLevel =["Dễ","TB","Khó"];

  @override
  void initState() {
    // TODO: implement initState
    _questionController.text = widget._question.question;
    _aAnswerController.text = widget._question.a;
    _bAnswerController.text = widget._question.b;
    _cAnswerController.text = widget._question.c;
    _dAnswerController.text = widget._question.d;
    _explainAnswerController.text = widget._question.explain;
    _selectedAnswerCorrect= widget._question.correct;
    _selectedLevel =levelToString(widget._question.idLevel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          SizedBox(
            height: 30,
//              width: MediaQuery.of(context).size.width*2/4,
          ),
          Text("HIỆU CHỈNH CÂU HỎI", style: TextStyle(
              color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 3,
              child: TextFormField(
                controller: _questionController,
                decoration: InputDecoration(
                    labelText: "Câu hỏi",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    )
                ),
                maxLines: 4,
              ),
            ),
          ),

//          //a
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 3,
              child: TextFormField(
                controller: _aAnswerController,
                decoration: InputDecoration(
                    labelText: "Đáp án A",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    )
                ),
                maxLines: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 3,
              child: TextFormField(
                controller: _bAnswerController,
                decoration: InputDecoration(
                    labelText: "Đáp án B",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    )
                ),
                maxLines: 1,
              ),
            ),
          ),
          //b
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 3,
              child: TextFormField(
                controller: _cAnswerController,
                decoration: InputDecoration(
                    labelText: "Đáp án C",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    )
                ),
                maxLines: 1,
              ),
            ),
          ),
          //c
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 3,
              child: TextFormField(
                controller: _dAnswerController,
                decoration: InputDecoration(
                    labelText: "Đáp án D",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    )
                ),
                maxLines: 1,
              ),
            ),
          ),
          //đáp án đúng
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 3,
            child: Text("Đáp án đúng", style: TextStyle(color: Colors.grey),textAlign: TextAlign.start,),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 5+20,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)))
                    ),
                    hint: Text("Đáp án đúng"),
                    value: _selectedAnswerCorrect,
                    items:_listAnswer.map((String value) {
                      return  DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value, style: TextStyle(color: Colors.blue),),
                      );
                    }).toList() ,
                    onChanged: (String tmp) {
                      setState(() {
                        _selectedAnswerCorrect  = tmp;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(top: 5, bottom: 5, right: 50),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width *2/ 35+50,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)))
                    ),
                    hint: Text("Độ khó"),
                    value: _selectedLevel,
                    items:_listLevel.map((String value) {
                      return  DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value, style: TextStyle(color: Colors.blue),),
                      );
                    }).toList() ,
                    onChanged: (String tmp) {
                      setState(() {
                        _selectedLevel  = tmp;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),


          //chú thích
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 3,
              child: TextFormField(
                controller: _explainAnswerController,
                decoration: InputDecoration(
                    labelText: "Chú giải cho đáp án",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    )
                ),
                maxLines: 4,
              ),
            ),
          ),
          //button
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                RaisedButton(
                  onPressed: () {
                    Question oldQuestion = widget._question;
                    Question question = Question(id: oldQuestion.id,
                      idTheme: oldQuestion.idTheme,
                      idLevel: levelStrToInt(_selectedLevel),
                      a: _aAnswerController.text,
                    b: _bAnswerController.text,
                    c: _cAnswerController.text,
                    d: _dAnswerController.text,
                    question: _questionController.text,
                    explain: _explainAnswerController.text,
                    correct: _selectedAnswerCorrect);
                    Get.back(result: question);
                  },
                  child: Text("Hoàn tất"),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Hủy"),
                ),
//                SizedBox(
//                  width: 10,
//                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  String levelToString(int idLevel) {
    if(idLevel==1) return "Dễ";
    if(idLevel==2) return "TB";
    if(idLevel==3) return "Khó";
  }
  int levelStrToInt(String levelStr) {
    if(levelStr=="Dễ") return 1;
    if(levelStr=="TB") return 2;
    if(levelStr=="Khó") return 3;
  }
}
