import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

var _telnamb= ["79995554433"];
var _username = ["username"];
var _password = ["password123"];
int _i = 1;

class Authenticat{
  bool checkNumb(String number){
    for(var j = 0; j< _telnamb.length; j++){
      if(number == _telnamb){
        return true;}
    }
    return false;
  }
}
class Authentication {
  bool fetchCredentials(String username, String password) {
    for (var j = 0; j < _username.length; j++) {
      if (username == _username[j] && password == _password[j]) {
        return true;
      }
    }
    return false;
  }

  bool checkUserRepeat(username) {
    for (var j = 0; j < _username.length; j++) {
      if (username == _username[j]) {
        print(username);
        return true;
      }
    }
    return false;
  }

  void insertCredentials(username, password) {
    _username.add(username);
    _password.add(password);
    _i++;
  }

  bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
    password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits &
    hasUppercase &
    hasLowercase &
    hasSpecialCharacters &
    hasMinLength;
  }
}
