

import 'package:get/get.dart';
import 'package:object_tive_test/src/data/models/ReviewExam.dart';
import 'package:object_tive_test/src/loading_page.dart';
import 'package:object_tive_test/src/ui/Hoc/HocBloc.dart';
import 'package:object_tive_test/src/ui/Hoc/HocUI.dart';
import 'package:object_tive_test/src/ui/chonchudehoc/ChonChuDeHocBloc.dart';
import 'package:object_tive_test/src/ui/chonchudehoc/ChonChuDeHocUI.dart';
import 'package:object_tive_test/src/ui/chucnang/ChucNangBloc.dart';
import 'package:object_tive_test/src/ui/chucnang/ChucNangUI.dart';
import 'package:object_tive_test/src/ui/exam/ExamBloc.dart';
import 'package:object_tive_test/src/ui/exam/ExamUI.dart';
import 'package:object_tive_test/src/ui/home/home_bloc.dart';
import 'package:object_tive_test/src/ui/home/home_ui.dart';
import 'package:object_tive_test/src/ui/review/ReviewExamBloc.dart';
import 'package:object_tive_test/src/ui/review/ReviewExamUI.dart';
import 'package:object_tive_test/src/ui/users/forgot/forgot_password_bloc.dart';
import 'package:object_tive_test/src/ui/users/forgot/forgot_password_ui.dart';
import 'package:object_tive_test/src/ui/users/login/login_bloc.dart';
import 'package:object_tive_test/src/ui/users/login/login_ui.dart';
import 'package:object_tive_test/src/ui/users/register/register_bloc.dart';
import 'package:object_tive_test/src/ui/users/register/register_ui.dart';
import 'package:object_tive_test/src/ui/users/resetpassword/reset_password_bloc.dart';
import 'package:object_tive_test/src/ui/users/resetpassword/reset_password_ui.dart';
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
      ..add(GetPage(
          name: ExamUI.routerName,
          page: ()=>BlocProvider(bloc: ExamBloc(),child: ExamUI(),)
      ))
      ..add(GetPage(
          name: ChucNangUI.routerName,
          page: ()=>BlocProvider(bloc: ChucNangBloc(),child: ChucNangUI(),)
      ))
      ..add(GetPage(
          name: ReviewExamUI.routerName,
          page: ()=>BlocProvider(bloc: ReviewExamBloc(),child: ReviewExamUI(),)
      ))
      ..add(GetPage(
          name: ChonChuDeHocUI.routerName,
          page: ()=>BlocProvider(bloc: ChonChuDeHocBloc(),child: ChonChuDeHocUI(),)
      ))
      ..add(GetPage(
          name: HocUI.routerName,
          page: ()=>BlocProvider(bloc: HocBloc(),child: HocUI(),)
      ))
      ..add(GetPage(
          name: RegisterUI.routName,
          page: ()=>BlocProvider(bloc: RegisterBloc(),child: RegisterUI(),)
      ))
      ..add(GetPage(
          name: ResetPasswordUi.routName,
          page: ()=>BlocProvider(bloc: ResetPasswordBloc(),child: ResetPasswordUi(),)
      ))
          ////////////////////////////////////////////////////
        ;

    return router;
  }
}
