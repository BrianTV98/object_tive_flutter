import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/data/models/Theme.dart';
import 'package:object_tive_test/src/ui/Hoc/HocUI.dart';
import 'package:object_tive_test/src/ui/chonchudehoc/ChonChuDeHocBloc.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';

class ChonChuDeHocUI extends StatefulWidget {

  static String  routerName = "/ChonChuDeHoc";

  int idSubject= Get.arguments as int;

  @override
  _ChonChuDeHocUIState createState() => _ChonChuDeHocUIState();
}

class _ChonChuDeHocUIState extends State<ChonChuDeHocUI> {

  ChonChuDeHocBloc _chonChuDeHocBloc;

  @override
  void initState() {
    // TODO: implement initState
    _chonChuDeHocBloc = BlocProvider.of<ChonChuDeHocBloc>(context);
    _chonChuDeHocBloc.getListTheme(widget.idSubject);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: StreamBuilder<List<Themes>>(
            stream: _chonChuDeHocBloc.themesStream,
            builder: (context, snapshot){

              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                  return  Container(

                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  List<Themes> themes =snapshot.data;
                  return  ListView.builder(
                      itemCount:themes.length ,
                      itemBuilder: (context, index){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: ()=>Get.toNamed(HocUI.routerName,arguments:{'idSubject' : widget.idSubject, 'idTheme':themes[index].id}),
                                      behavior: HitTestBehavior.translucent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.blue.withOpacity(0.7),
                                        ),
                                          height: 100,
                                          child: Stack(
                                            children: [
                                              Center(child: Text(themes[index].name,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                            ],
                                          ),
                                          width: 100,
                                      ),

                                  )
                                ],
                              ),
                            ),
                            Text("${themes[index].percent} %"),
                            Container(
                              height: 10,
                              width: MediaQuery.of(context).size.width/2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: themes[index].percent.toDouble()/100,
                                  backgroundColor:  Color(0xffD6D6D6),
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                ),
                              ),
                            )
                          ],
                        );
                      }
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
}
