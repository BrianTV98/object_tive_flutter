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
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(
                                  onPressed: ()=>Get.toNamed(HocUI.routerName,arguments: widget.idSubject),
                                  child: Container(
                                      child: Text(themes[index].name,style: TextStyle(color: Colors.white),),
                                      width: MediaQuery.of(context).size.width-150,
                                  ),
                                  color: Colors.blue,
                              )
                            ],
                          ),
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
