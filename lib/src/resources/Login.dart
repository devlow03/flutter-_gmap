import 'package:flutter/material.dart';
import 'package:newapp/src/blocs/login_bloc.dart';

import 'Signup.dart';
import '../../main.dart';
import 'HomeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginBloc bloc = new LoginBloc();


  bool ishiddenpass = true;
  TextEditingController _mailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  
  Widget _tfuser() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: bloc.mailStream,
          builder:(context, snapshot) =>
          TextField(
          controller: _mailController,
          onChanged: (value) => () {},
          decoration: InputDecoration(
              hintText: 'Email',
              errorText: snapshot.hasError ? snapshot.error as String : null ,
              contentPadding: const EdgeInsets.all(20),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              prefixIcon: Icon(Icons.email)),
        ), ),
      
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget _tfpass() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: bloc.passStream,
          builder: (context, snapshot) =>  TextField(
          controller: _passController,
          obscureText: ishiddenpass,
          onChanged: (value) => () {},
          decoration: InputDecoration(
              hintText: 'Mật khẩu',
               errorText: snapshot.hasError ? snapshot.error as String : null ,
               suffixIcon: InkWell(
                 onTap: _togglePassView,
                 child: Icon(Icons.visibility)),
              contentPadding: const EdgeInsets.all(20),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              prefixIcon: Icon(Icons.lock)),
        ),),
        SizedBox(
          height: 10,
        )
       
      ],
    );
  }

  Widget _btnforgotpass() {
    return Container(
      height: 50,
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Text(
          'Quên mật khẩu?',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
        
      ),
      
    );
    
  }

  Widget _btnLogin() {
    return Container(
      width: double.infinity,
      height: 130,
      padding: const EdgeInsets.symmetric(vertical: 40),
      
      child: RaisedButton(
        onPressed: _onSinginCliked,
        elevation:5,
        child: Text(
          'Đăng nhập',
          style:
              TextStyle(fontSize: 20, letterSpacing: 1.5, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.blue[600],
      ),
    );
  }

  Widget _btnSignup() {
    return Container(
      width: double.infinity,
      height: 20,
      
      child: FlatButton(
        onPressed: () {
           Navigator.pushAndRemoveUntil(context,
                     MaterialPageRoute(builder: (_)=> SignupPage()),
                     (route) => false);
        },
        child: Text(
          'Chưa có tài khoản? Đăng kí',
          style:
              TextStyle(fontSize: 15, color: Colors.white, letterSpacing: 1.5),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        // color: Colors.orange[600],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
              Color.fromARGB(255, 104, 166, 241),
                Color(0xff61a4f1),
                Color(0xff478de0),
                Color(0xff398ae5),

                ],
              )
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  //title
                  Text(
                    'My Map',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  _tfuser(),
                  _tfpass(),
                  _btnforgotpass(),
                  _btnLogin(),
                  _btnSignup()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _togglePassView(){
    // if(ishiddenpass == true){
    //    ishiddenpass == false;
    // }
    // else{ 
    //   ishiddenpass == true;
    // }
    setState(() {
       ishiddenpass = ! ishiddenpass;
    });
  
  }

  // ignore: curly_braces_in_flow_control_structures
  void _onSinginCliked(){
    if (bloc.ValidInfo(_mailController.text, _passController.text)){
       Navigator.push(context, MaterialPageRoute(builder: gotoHomePage));
    }

    
   
  }

  Widget gotoHomePage(BuildContext context){
    return MapScreen();

  }
}

