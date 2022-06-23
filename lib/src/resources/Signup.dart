import 'package:flutter/material.dart';
import '../../main.dart';
import 'HomeScreen.dart';
import 'Login.dart';
import 'package:newapp/src/blocs/Signup_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupBloc blocs = new SignupBloc();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _mailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  @override
  void dispose(){
    blocs.dispose();
    super.dispose();

  }
  Widget _tfname() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: blocs.namestream,
          builder: (context, snapshot) =>  
        TextField(
          controller: _nameController,
          onChanged: (value) => () {},
          decoration: InputDecoration(
              hintText: 'Tên của bạn',
              errorText: snapshot.hasError ? snapshot.error as String : null,
              
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
              prefixIcon: Icon(Icons.person)),
        ),),
       
         SizedBox(
          height: 30,
        )
      ],
    );
  }
  Widget _tfphone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: blocs.phonestream,
          builder: (context, snapshot) => 
          TextField(
            controller: _phoneController,
          onChanged: (value) => () {},
          decoration: InputDecoration(
              hintText: 'Nhập số điện thoại',
              errorText: snapshot.hasError ? snapshot.error as String : null,
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
              prefixIcon: Icon(Icons.phone)),
        ),),
        
          SizedBox(
          height: 30,
        )
      ],
    );
  }
  Widget _tfmail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: blocs.mailstream,
          builder: (context, snapshot) =>
          TextField(
            controller: _mailController,
          onChanged: (value) => () {},
          decoration: InputDecoration(
              hintText: 'Nhập email của bạn',
              errorText: snapshot.hasError ? snapshot.error as String : null,
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
          height: 30,
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
          stream: blocs.passstream,
          builder: (context, snapshot) => 
           TextField(
             controller: _passController,
          onChanged: (value) => () {},
          decoration: InputDecoration(
              hintText: 'Mật khẩu',
              errorText: snapshot.hasError ? snapshot.error as String : null,
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
              
        ),
        ),
       
          SizedBox(
          height: 30,
        )
      ],
    );
  }
  Widget _btnSignup() {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: _onSignupClicked,
        child: Text(
          'Đăng kí',
          style:
              TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 1.5),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.orange[600],
      ),
    );
  }
  Widget _btnLogin() {
    return Container(
      width: double.infinity,
      height: 50,
      
      child: FlatButton(
        
        onPressed: () {
          Navigator.pushAndRemoveUntil(context,
                     MaterialPageRoute(builder: (_)=>LoginPage()),
                     (route) => false);
          
          
        },
        child: Text(
          'Đã có tài khoản? Đăng nhập',
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
                    'Đăng kí tài khoản',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  _tfname(),
                  _tfphone(),
                  _tfmail(),
                  _tfpass(),
                  _btnSignup(),
                  _btnLogin()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSignupClicked(){
    if (blocs.isValid(_nameController.text, _phoneController.text,_mailController.text,_passController.text)){
       Navigator.push(context, MaterialPageRoute(builder: gotoHomePage));
    }

    
   
  }

  Widget gotoHomePage(BuildContext context){
    return MapScreen();

  }
}

