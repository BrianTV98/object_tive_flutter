

import 'package:get/get.dart';
import 'package:object_tive_test/src/loading_page.dart';
import 'package:object_tive_test/src/ui/home/home_bloc.dart';
import 'package:object_tive_test/src/ui/home/home_ui.dart';
import 'package:object_tive_test/src/ui/users/forgot/forgot_password_bloc.dart';
import 'package:object_tive_test/src/ui/users/forgot/forgot_password_ui.dart';
import 'package:object_tive_test/src/ui/users/login/login_bloc.dart';
import 'package:object_tive_test/src/ui/users/login/login_ui.dart';
import 'package:object_tive_test/src/ui/users/register/register_bloc.dart';
import 'package:object_tive_test/src/ui/users/register/register_ui.dart';
import 'package:object_tive_test/src/utlis/manager/BaseBloc.dart';

class RouterManager {
  static List<GetPage> router() {
    List<GetPage> router = List<GetPage>()
      ..add(GetPage(
          name: LoginScreenUI.routName,
          page: () =>
              BlocProvider(bloc: LoginBloc(), child: LoginScreenUI())))
      ..add(GetPage(
        name: HomeUI.routName,
        page: ()=> BlocProvider(bloc: HomeBloc(),child: HomeUI(),)
      ))
      ..add(GetPage(
          name: RegisterUI.routName,
          page: ()=> BlocProvider(bloc: RegisterBloc(),child: RegisterUI(),)
      ))
      ..add(GetPage(
          name: ForgotPasswordUI.routName,
          page: ()=> BlocProvider(bloc: ForgotPasswordBloc(),child: ForgotPasswordUI(),)
      ))
      ..add(GetPage(
          name: LoadingPage.routerName,
          page: ()=>LoadingPage()
      ))
          ////////////////////////////////////////////////////
        ;

    return router;
  }
}
