import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth{
   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void signUp(String name, String phone, String mail, String pass){
    _firebaseAuth.createUserWithEmailAndPassword(email: mail, password: pass).then((user){
      
      _createUser(user.uid, name, phone);
      print(user);
    }).catchError((err){
      // TODO

    });
  }
  _createUser(String userID, String name, String phone){
    var user = {
      "name": name,
      "phone": phone,
      


    };
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userID).set(user).then((user){
      // SUCCESS

    }).catchError((err){
      // TODO
    });

  }
}