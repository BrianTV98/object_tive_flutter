class ImageManager{
  static final ImageManager _instance = ImageManager._();

  factory ImageManager(){
    return _instance;
  }

  ImageManager._();

  final String iconAvata='assets/images/icon_avata.png';

  final String iconFix='assets/images/fix.png';

  final String iconLanguage='assets/images/language.png';

  final String iconUpdate='assets/images/update.png';
}