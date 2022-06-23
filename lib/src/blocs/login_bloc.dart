import 'dart:async';
import 'package:newapp/src/validator/validation.dart';
class LoginBloc {
  StreamController _mailController = new StreamController();
  StreamController _passController = new StreamController();

  //Tạo 2 hàm get Stream
  Stream get mailStream => _mailController.stream;
  Stream get passStream => _passController.stream;


  // ignore: non_constant_identifier_names
  bool ValidInfo(String mail,String pass){
    //nếu user không hợp lệ
    if(!Validation.isValidMail(mail)){
      _mailController.sink.addError('Tài khoản không hợp lệ');
      return false;
    }
     _mailController.sink.add("OK");
    if(!Validation.isValidPassword(pass)){
      _passController.sink.addError('Mật khẩu phải trên 6 kí tự');
      return false;
    }
   
    _passController.sink.add("OK");
    return true;

  }
  void dispose(){
    _mailController.close();
    _passController.close();

  }
}
