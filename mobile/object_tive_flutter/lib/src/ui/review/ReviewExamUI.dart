import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/data/models/ReviewExam.dart';
import 'package:object_tive_test/src/ui/review/ReviewExamBloc.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';

class ReviewExamUI extends StatefulWidget {
  static String routerName ="/ReviewExamUI";
  @override
  _ReviewExamUIState createState() => _ReviewExamUIState();
}

class _ReviewExamUIState extends State<ReviewExamUI> {

  ReviewExamBloc _reviewExamBloc;
  int indexQuestion =1;
  int idSubject= Get.arguments as int;
  @override
  void initState() {
    // TODO: implement initState
    _reviewExamBloc = BlocProvider.of<ReviewExamBloc>(context);
    _reviewExamBloc.getReviewExam(idSubject);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<List<ReviewExam>>(
              stream: _reviewExamBloc.questionStream,
              builder: (context,snapshot){

                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                    return  Container(

                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    List<ReviewExam> _listQuestion = snapshot.data;
                    if(_listQuestion.length==0) return Container(
                        height: MediaQuery.of(context).size.height-56,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("Bạn chưa có bài thi"),
                        )
                    );
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: SizeManager().size_padding_default, vertical: SizeManager().size_padding_default/2),
                          padding: EdgeInsets.all(SizeManager().size_padding_default),
                          height: MediaQuery.of(context).size.height/6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue.withOpacity(0.5)
                          ),
                          child: Text(_listQuestion[indexQuestion-1].question),
                        ),
                        componentAnswer("A", _listQuestion[indexQuestion-1].a, _listQuestion[indexQuestion-1]),
                        componentAnswer("B", _listQuestion[indexQuestion-1].b,_listQuestion[indexQuestion-1]),
                        componentAnswer("C", _listQuestion[indexQuestion-1].c, _listQuestion[indexQuestion-1]),
                        componentAnswer("D", _listQuestion[indexQuestion-1].d,_listQuestion[indexQuestion-1]),
                        Row(
                          children: [
                              RaisedButton(
                                child: Text(
                                  "Xem chú thích"
                                ),
                                onPressed: () =>Get.dialog(ExplainDialog(_listQuestion[indexQuestion-1].explain)),
                              ),
                            SizedBox(
                              width: 16,
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(Icons.skip_previous),
                              onPressed: (){
                                if(indexQuestion>1){
                                  setState(() {
                                    indexQuestion--;
                                  });
                                }
                              },
                            ),
                            Text("Câu hỏi: $indexQuestion/30",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            IconButton(
                              icon: Icon(Icons.skip_next),
                              onPressed: (){
                                if(indexQuestion<30){
                                  setState(() {
                                    indexQuestion++;
                                  });
                                }
                              },
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
          ],
        ),
      ),
    );
  }
  Widget componentAnswer(String title, String content, ReviewExam reviewExam){
    // - color  mau vang: dap an dung, -> correct ==choose ,
    // -- color ma do : dap an ban chon -> correct!=choose
    Color color;
    if(title!=reviewExam.chooseAnswer &&title!=reviewExam.correct){
      color= Colors.blue.withOpacity(0.7);
    }
    else{
      if(title==reviewExam.correct){
        color=Colors.yellow;
      }
      else color =Colors.red;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:20),
          child: Text(title),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: SizeManager().size_padding_default, vertical: SizeManager().size_padding_default/2),
          padding: EdgeInsets.symmetric(horizontal: SizeManager().size_padding_default, vertical: SizeManager().size_padding_default/2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color:color
          ),
          height:MediaQuery.of(context).size.height/11,
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
}

class ExplainDialog extends StatefulWidget {
  String explain;
  ExplainDialog(this.explain);

  @override
  _ExplainDialogState createState() => _ExplainDialogState();
}

class _ExplainDialogState extends State<ExplainDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(ImageManager().iconExplain,height: 50,width: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((widget.explain==null ||widget.explain.trim()=="")?"Chưa có phần giải nghĩa": widget.explain.trim()),
          ),
          RaisedButton(
            onPressed: ()=> Get.back(),
            child: Text("OK"),
          )
        ],
      ),
    );
  }
}
