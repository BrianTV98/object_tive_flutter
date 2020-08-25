import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/data/models/DetailExam.dart';
import 'package:object_tive_test/src/data/models/Exam.dart';
import 'package:object_tive_test/src/data/models/Question.dart';
import 'package:object_tive_test/src/data/models/Subject.dart';
import 'package:object_tive_test/src/ui/exam/DialogCauHoiChuaTraLoi.dart';
import 'package:object_tive_test/src/ui/exam/ExamBloc.dart';
import 'package:object_tive_test/src/ui/home/home_ui.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';

class ExamUI extends StatefulWidget {
  static String routerName="/ExamUI";

  Subject _subject = Get.arguments as Subject;
  @override
  _ExamUIState createState() => _ExamUIState();
}

class _ExamUIState extends State<ExamUI> {

  int indexQuestion=1;
  int minute =19;
  String second ="00";

  Timer _timer;
  int _start = 60;


  ExamBloc _examBloc;
  List<Exam> _listResult =List<Exam>();
  List<DetailExam> _listDetailExam = List<DetailExam>();

  @override
  void initState() {
    // TODO: implement initState
     _examBloc =BlocProvider.of<ExamBloc>(context);
     _examBloc.getExam(widget._subject.id);
     startTimer();

    // init listResult;
    for(int i=0; i<30;i++){
      _listResult.add(new Exam());
    }

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            if(minute>0){
              minute--;
              _start=59;
            }
            else {
              if(_timer.isActive)
                _timer.cancel();
              }
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    String sencond = (_start<10) ? "0$_start": _start.toString();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    child: Text("Nộp bài",style: TextStyle(color: Colors.white),),
                    onPressed: ()=>btnNopBai(),
                    color: Colors.red,
                  ),
                  Text("Thời gian: $minute : $sencond",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),

            StreamBuilder<List<DetailExam>>(
              stream: _examBloc.questionStream,
              builder: (context,snapshot){
                List<DetailExam> _listQuestion = snapshot.data;

                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                  return  Container(

                  );
                  case ConnectionState.active:
                  case ConnectionState.done:

                  _listDetailExam=_listQuestion;
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
                        GestureDetector(
                            child: componentAnswer("Đáp án A", _listQuestion[indexQuestion-1].a, (_listResult[indexQuestion-1].chooseAnswer=="A")),
                            onTap: ()=> setResult(Exam()..idExam=0..idQuestion=_listQuestion[indexQuestion-1].id..chooseAnswer="A"),
                            behavior: HitTestBehavior.translucent,
                        ),
                        GestureDetector(
                            child: componentAnswer("Đáp án B", _listQuestion[indexQuestion-1].b,_listResult[indexQuestion-1].chooseAnswer=="B"),
                          onTap: ()=> setResult(Exam()..idExam=0..idQuestion=_listQuestion[indexQuestion-1].id..chooseAnswer="B"),
                          behavior: HitTestBehavior.translucent,
                        ),
                        GestureDetector(
                            child: componentAnswer("Đáp án C", _listQuestion[indexQuestion-1].c, _listResult[indexQuestion-1].chooseAnswer=="C"),
                          onTap: ()=> setResult(Exam()..idExam=0..idQuestion=_listQuestion[indexQuestion-1].id..chooseAnswer="C"),
                          behavior: HitTestBehavior.translucent,
                        ),
                        GestureDetector(
                            child: componentAnswer("Đáp án D", _listQuestion[indexQuestion-1].d,_listResult[indexQuestion-1].chooseAnswer=="D"),
                          onTap: ()=> setResult(Exam()..idExam=0..idQuestion=_listQuestion[indexQuestion-1].id..chooseAnswer="D"),
                          behavior: HitTestBehavior.translucent,
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

  Widget componentAnswer(String title, String content, bool isSelect){
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
              color:(isSelect)? Colors.yellow.withOpacity(0.7): Colors.blue.withOpacity(0.5)
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

  void setResult(Exam exam) {
      setState(() {
        _listResult[indexQuestion-1]=exam;
      });
  }

  void btnNopBai() async {
    String cauHoiChuaTraLoi = "";
    for(int i=0; i<30;i++){
      if(_listResult[i].chooseAnswer ==null) cauHoiChuaTraLoi=cauHoiChuaTraLoi+" "+ (i+1).toString();
    }
    bool check= true;
    if(cauHoiChuaTraLoi!=""){
      check = await Get.dialog(DialogCauHoiChuaTraLoi(cauHoiChuaTraLoi));
    }

    if(check==true){
      //tinh diem

      int soCauDung =0;
      for(int i=0; i<30;i++){
          if(_listDetailExam[i].correct == _listResult[i].chooseAnswer){
            soCauDung++;
          }
      }

      double diem = (10/30) *soCauDung;
      String thoiGianThi = "${20-minute} phút ${60-_start} giây";

      var checkTmp=  await Get.dialog(ShowKetQuaThi(soCauDung,thoiGianThi,diem));

      _listResult.removeWhere((element) => element.idExam==null); // fix bug idExam null
      _listResult.forEach((element) {  // fix bug idExam null
        element.idExam = _listDetailExam[0].idExam;
      });
      _examBloc.updateKetQuaThi(_listResult);
      if(checkTmp ==null){
        Get.offAllNamed(HomeUI.routName);
      }
    }

  }

}
class ShowKetQuaThi extends StatefulWidget {

  int soCauDung;
  String thoigianthi;
  double diem;

  ShowKetQuaThi(this.soCauDung, this.thoigianthi, this.diem);

  @override
  _ShowKetQuaThiState createState() => _ShowKetQuaThiState();
}

class _ShowKetQuaThiState extends State<ShowKetQuaThi> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Kết quả thi",
                  style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Tổng số câu hỏi trả lời đúng: ${widget.soCauDung} /30"),
            SizedBox(
              height: 10,
            ),
            Text("Thời gian thi: ${widget.thoigianthi}"),
            SizedBox(
              height: 10,
            ),
            Text("Số điểm của bạn: ${widget.diem.toStringAsFixed(2)} điểm"),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: ()=>Get.offAndToNamed(HomeUI.routName),
                  child: Text(
                    "Quay lại trang chủ"
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}

