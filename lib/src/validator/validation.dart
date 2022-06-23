class Validation{
  static bool isValidName(String name){
    return name != null && name.length > 2 ;
  }
  static bool isValidPhone(String phone){
    return phone != null && phone.length > 9 ;
  }
  static bool isValidMail(String mail){
    return mail != null && mail.length > 6 && mail.contains("@");
  }
  static bool isValidPassword(String pass){
    return pass != null && pass.length > 6 ;
  }

}