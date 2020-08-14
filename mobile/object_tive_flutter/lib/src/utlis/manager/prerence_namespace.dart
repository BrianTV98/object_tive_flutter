class NameSpace{

  static final NameSpace _instance = NameSpace._();

  factory NameSpace(){
    return _instance;
  }

  NameSpace._();

  final String isLogin ='isLogin';
  final String userName ='userName';
}