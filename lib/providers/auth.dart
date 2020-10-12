import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/helper/user_helper.dart';
import 'package:food_app/models/user.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Unauthenticated;
  Firestore _firestore = Firestore.instance;
  UserService _userService = UserService();
  UserModel _userModel;

  // getters
  Status get status => _status;
  UserModel get userModel => _userModel;
  FirebaseUser get user => _user;

  final formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController(); 
  TextEditingController password = TextEditingController(); 

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      return true;
    } catch (e) {
      // _status = Status.Unauthenticated;
      // notifyListeners();
      // print("error" + e.toString());
      // return false;
      return _onError(e.toString());
    }
  }

  Future singOut(){
    _auth.signOut();
    _status  = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((user) {
        Map<String, dynamic> values = {
          "name": name.text,
          "email": email.text,
          "id": user.user.uid
        };
        _userService.createUser(values);
      });
      return true;
    } catch (e) {
     bool value = _onError(e.toString());
     return value;
    }
  }


  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userService.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

    bool _onError(String error){
    
      _status = Status.Unauthenticated;
      notifyListeners();
      print("error + $error");
      return false;
  }

  void cleanControllers(){
    email.text = "";
    password.text ="";
    name.text ="";

  }
}
