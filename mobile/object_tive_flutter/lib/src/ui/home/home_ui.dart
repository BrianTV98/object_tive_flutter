import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_tive_test/src/data/models/Subject.dart';
import 'package:object_tive_test/src/ui/chucnang/ChucNangUI.dart';
import 'package:object_tive_test/src/ui/home/home_bloc.dart';
import 'package:object_tive_test/src/ui/setting/setting_ui.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';
import 'package:object_tive_test/src/utlis/manager/image_manager.dart';
import 'package:object_tive_test/src/utlis/manager/size_manager.dart';
import 'package:object_tive_test/src/utlis/widget/app_bar.dart';

class HomeUI extends StatefulWidget {
  static String routName = "/HomeUI";

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  String imagUrl =
      "https://png.pngtree.com/element_our/20190530/ourlarge/pngtree-520-couple-avatar-boy-avatar-little-dinosaur-cartoon-cute-image_1263411.jpg";

  String imageFlutter ="assets/images/flutter.png";
  String imageJava ="assets/images/java.png";
  String imageToanCaoCap="assets/images/math.png";

  HomeBloc _homeBloc;
  List<Subject> _listSubject = List<Subject>();

  @override
  void initState() {
    // TODO: implement initState
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.getListSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SettingUI(),
      ),
      body: StreamBuilder<List<Subject>>(
        stream: _homeBloc.subjectStream,
        builder: (context, snapshot) {
          if (snapshot.data != null) _listSubject = snapshot.data;
          return ListView.builder(
              itemCount: _listSubject.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: ()=> Get.toNamed(ChucNangUI.routerName, arguments: _listSubject[index]),
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(75),
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                children: [
                                  if(index==0 )Image.asset(imageFlutter,height: 140,width: 140, fit: BoxFit.cover,),
                                  if(index==1 )Image.asset(imageJava,height: 140,width: 140, fit: BoxFit.cover,),
                                  if(index==2 )Image.asset(imageToanCaoCap,height: 145,width: 145, fit: BoxFit.cover,),
                                ],
                              )
                            ),
                          ),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            border:  Border.all(width: 1, color: Colors.blue)
                          ),
                        ),
                      ),
                      Text(_listSubject[index].name)
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
