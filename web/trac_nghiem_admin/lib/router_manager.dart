import 'package:get/get.dart';
import 'package:trac_nghiem_admin/ui/home/EditQuestion/edit_question_bloc.dart';
import 'package:trac_nghiem_admin/ui/home/EditQuestion/edit_question_ui.dart';
import 'package:trac_nghiem_admin/ui/home/InputQuestion/InputQuestionBloc.dart';
import 'package:trac_nghiem_admin/ui/home/InputQuestion/InputQuestionUI.dart';
import 'package:trac_nghiem_admin/ui/home/home_bloc.dart';
import 'package:trac_nghiem_admin/ui/home/home_ui.dart';
import 'package:trac_nghiem_admin/ui/login/login_bloc.dart';
import 'package:trac_nghiem_admin/ui/login/login_screen.dart';
import 'package:trac_nghiem_admin/utils/base_bloc.dart';

class RouterManager {
  static List<GetPage> router() {
    List<GetPage> router = List<GetPage>()
      ..add(GetPage(
          name: LoginScreenUI.routName,
          page: () =>
              BlocProvider(bloc: LoginBloc(), child: LoginScreenUI())))
      ..add(GetPage(
          name: HomeUI.routName,
          page: () =>
              BlocProvider(bloc: HomeBloc(), child: HomeUI())))
      ..add(GetPage(
          name: InputQuestionUI.routerName,
          page: () =>
              BlocProvider(bloc: InputQuestionBloc(), child: InputQuestionUI())))
    ////////////////////////////////////////////////////
        ;

    return router;
  }
}