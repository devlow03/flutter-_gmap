import 'dart:async';

import 'package:newapp/src/validator/validation.dart';

class SignupBloc{
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _mailController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get namestream => _nameController.stream;
  Stream get phonestream => _phoneController.stream;
  Stream get mailstream => _mailController.stream;
  Stream get passstream => _passController.stream;


  bool isValid(String name, String phone, String mail, String pass){
   if(Validation.isValidName(name) != true){
      _nameController.sink.addError('Tên không hợp lệ');
      return false;
    }
     _nameController.sink.add("OK");
    // _nameController.sink.add("");

    if(!Validation.isValidPhone(phone)){
      _phoneController.sink.addError('SỐ điện thoại không hợp lệ');
      return false;
    }
    _phoneController.sink.add("");

    if(!Validation.isValidMail(mail)){
      _mailController.sink.addError('Email không hợp lệ');
      return false;
    }
    
    

      if(!Validation.isValidPassword(pass)){
      _passController.sink.addError('Mật khẩu từ 6 kí tự trở lên');
      return false;
    }
    _passController.sink.add("");

    
    return true;

  }

  void dispose(){
    _nameController.close();
    _phoneController.close();
    _mailController.close();
    _passController.close();

  }


}