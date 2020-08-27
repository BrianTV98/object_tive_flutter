import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/data/models/Exam.dart';
import 'package:object_tive_test/src/data/models/LearningProcess.dart';
import 'package:object_tive_test/src/ui/Hoc/HocBloc.dart';
import 'package:object_tive_test/src/ui/review/ReviewExamUI.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';

class HocUI extends StatefulWidget {
  static String routerName ="/HocUI";

  int idThemes = Get.arguments;
  @override
  _HocUIState createState() => _HocUIState();
}

class _HocUIState extends State<HocUI> {

  HocBloc _hocBloc;
  int indexQuestion = 1;
  bool checkKiemTraDapAn =false;

  String chooseAnswer;
  @override
  void initState() {
    // TODO: implement initState
    _hocBloc = BlocProvider.of<HocBloc>(context);
    _hocBloc.getListLearningProcess(widget.idThemes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<LearningProcess>>(
          stream: _hocBloc.learningProcessStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Container(
                );
              case ConnectionState.active:
              case ConnectionState.done:
                List<LearningProcess> _listQuestion = snapshot.data;
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeManager().size_padding_default,
                          vertical: SizeManager().size_padding_default / 2),
                      padding: EdgeInsets.all(
                          SizeManager().size_padding_default),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue.withOpacity(0.5)
                      ),
                      child: Text(_listQuestion[indexQuestion - 1].question),
                    ),
                    GestureDetector(
                      child: componentAnswer("Đáp án A", _listQuestion[indexQuestion-1].a, (chooseAnswer=="A"),_listQuestion[indexQuestion-1].correct=="A"),
//                      onTap: ()=> setResult(Exam()..idExam=0..idQuestion=_listQuestion[indexQuestion-1].idQuestion..chooseAnswer="A"),
                      onTap: () =>setResult("A"),
                      behavior: HitTestBehavior.translucent,
                    ),
                    GestureDetector(
                      child: componentAnswer("Đáp án B", _listQuestion[indexQuestion-1].b,(chooseAnswer=="B"),_listQuestion[indexQuestion-1].correct=="B"),
                      //onTap: ()=> setResult(Exam()..idExam=0..idQuestion=_listQuestion[indexQuestion-1].idQuestion..chooseAnswer="B"),
                      onTap: ()=> setResult("B"),
                      behavior: HitTestBehavior.translucent,
                    ),
                    GestureDetector(
                      child: componentAnswer("Đáp án C", _listQuestion[indexQuestion-1].c, chooseAnswer=="C",_listQuestion[indexQuestion-1].correct=="C"),
                      onTap: ()=> setResult("C"),
                      behavior: HitTestBehavior.translucent,
                    ),
                    GestureDetector(
                      child: componentAnswer("Đáp án D", _listQuestion[indexQuestion-1].d,chooseAnswer=="D",_listQuestion[indexQuestion-1].correct=="D"),
//                      onTap: ()=> setResult(Exam()..idExam=0..idQuestion=_listQuestion[indexQuestion-1].idQuestion..chooseAnswer="D"),
                      onTap: ()=> setResult("D"),
                      behavior: HitTestBehavior.translucent,
                    ),
                    Row(
                      children: [
                        RaisedButton(
                          child: Text(
                              "KIỂM TRA ĐÁP ÁN  ", style: TextStyle(fontSize: 12),
                          ),
                          onPressed: (){
                            setState(() {
                              checkKiemTraDapAn =true;
                            });
                          },
                        ),
                        SizedBox(
                          width: 16,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        RaisedButton(
                          onPressed: checkKiemTraDapAn?()=>xemgiaithich(_listQuestion[indexQuestion-1].correct): null,
                          child: Text(
                              "XEM PHẦN GIẢI THÍCH", style: TextStyle(fontSize: 12),
                          ),
                        ),

                        RaisedButton(
                          onPressed: checkKiemTraDapAn?nextQuestion: null,
                          child: Text(
                            "CÂU HỎI TIẾP THEO",style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    )
                  ],
                );
              default :
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
            }
          },
        ),
      ),
    );
  }
  void nextQuestion(){

  }

  Future xemgiaithich(String correct){
    Get.dialog(ExplainDialog(correct));
  }

  Widget componentAnswer(String title, String content, bool isSelect,bool isCorrect) {

    Color  colors ;
    if(checkKiemTraDapAn==false)
      colors= (isSelect) ? Colors.purple.withOpacity(0.7) : Colors.blue
          .withOpacity(0.5);

    else{
       colors = (isSelect) ? Colors.red.withOpacity(0.7) : Colors.blue
          .withOpacity(0.5);

       if(isCorrect) colors =Colors.yellow.withOpacity(0.7);

    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(title),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: SizeManager()
              .size_padding_default, vertical: SizeManager()
              .size_padding_default / 2),
          padding: EdgeInsets.symmetric(
              horizontal: SizeManager().size_padding_default,
              vertical: SizeManager().size_padding_default / 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: colors
//              color: (isSelect) ? Colors.yellow.withOpacity(0.7) : Colors.blue
//                  .withOpacity(0.5)
          ),
          height: MediaQuery
              .of(context)
              .size
              .height / 11,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content),
            ],
          ),
        ),
      ],
    );
  }

  void setResult(String result) {
    setState(() {
      chooseAnswer=result;
    });
  }
}