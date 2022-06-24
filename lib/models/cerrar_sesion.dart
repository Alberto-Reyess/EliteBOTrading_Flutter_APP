import 'package:elitebotrading/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';



logout(){
  Preferences.email = '';
  Preferences.passwd = '';
  Preferences.uid = 0;
  Preferences.name = '';
  Preferences.apik = '';
  Preferences.apis = '';
  Preferences.conf = 0;

}