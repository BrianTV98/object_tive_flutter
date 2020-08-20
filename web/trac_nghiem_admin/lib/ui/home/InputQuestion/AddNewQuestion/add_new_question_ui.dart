import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trac_nghiem_admin/data/model/Question.dart';

class AddNewQuestionUI extends StatefulWidget {

  final int index;
  final String idLevel;
  final String idSubject;


  AddNewQuestionUI(this.index,this.idLevel, this.idSubject);

  @override
  _AddNewQuestionUIState createState() => _AddNewQuestionUIState();
}

class _AddNewQuestionUIState extends State<AddNewQuestionUI> {

  TextEditingController _questionController = TextEditingController();
  TextEditingController _aAnswerController = TextEditingController();
  TextEditingController _bAnswerController = TextEditingController();
  TextEditingController _cAnswerController = TextEditingController();
  TextEditingController _dAnswerController = TextEditingController();
  TextEditingController _explainAnswerController = TextEditingController();

  List<String> _listAnswer =["A","B","C","D"];

  List<Question> _listQuestion = List<Question>();
  String _selectedAnswerCorrect ;

  int index; // tạo id giả

  String _selectedLevel;
  List<String> _listLevel =["Dễ","TB","Khó"];

  @override
  void initState() {
    // TODO: implement initState
    index= widget.index;
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
          Text("THÊM CÂU HỎI", style: TextStyle(
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

          //a
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Đáp án đúng", style: TextStyle(color: Colors.grey),textAlign: TextAlign.start,),
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Text("Độ khó", style: TextStyle(color: Colors.grey),textAlign: TextAlign.start,),
                ),
              ],
            ),
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
              // độ khó
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
                    int check = checkValidate();

                    if(check==1){
                      Question question = Question(id: index,
                          idTheme: int.parse( widget.idSubject),
                          idLevel: int.parse(widget.idLevel),
                          a: _aAnswerController.text,
                          b: _bAnswerController.text,
                          c: _cAnswerController.text,
                          d: _dAnswerController.text,
                          question: _questionController.text,
                          explain: _explainAnswerController.text,
                          correct: _selectedAnswerCorrect);
                      _listQuestion.add(question);
                    }

                    setState(() {
                      index++;
                    });
                    Get.back(result: _listQuestion);
                  },
                  child: Text("Hoàn tất"),
                ),
                SizedBox(
                  width: 20,
                ),

                RaisedButton(
                  onPressed: () {
                    int dokho;
                    if(_selectedLevel==_listLevel[0]) dokho=0;
                    if(_selectedLevel==_listLevel[1]) dokho=1;
                    if(_selectedLevel==_listLevel[2]) dokho=2;
                    Question question = Question(id: 0,
                        idTheme: int.parse( widget.idSubject),
                        idLevel: dokho,
                        a: _aAnswerController.text,
                        b: _bAnswerController.text,
                        c: _cAnswerController.text,
                        d: _dAnswerController.text,
                        question: _questionController.text,
                        explain: _explainAnswerController.text,
                        correct: _selectedAnswerCorrect);
                    _listQuestion.add(question);
                    resetController();
                  },
                  child: Text("Tiếp tục"),
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
    );;
  }

  void resetController() {
    _questionController.text="";
    _aAnswerController.text="";
    _bAnswerController.text="";
    _cAnswerController.text="";
    _dAnswerController.text="";
    _selectedAnswerCorrect="";
    _explainAnswerController.text="";
  }

  int checkValidate() {
    return 1;
  }

}
