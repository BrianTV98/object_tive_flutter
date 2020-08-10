extension StringExtention on String{
  bool isEmail() {
    // return true if is Email , else reture false
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(this))
      return false;
    else
      return true;
  }

  bool isPassword(){

  }

  bool isPhoneNumber(){// chua biet check regex
    Pattern pattern = RegExp(r'^[a-zA-Z0-9]+$');
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(this))
      return false;
    else
      return true;
  }
}
