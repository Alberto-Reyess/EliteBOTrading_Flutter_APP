import 'dart:convert';
import 'dart:async';

import 'package:elitebotrading/main.dart';
import 'package:elitebotrading/shared_preferences/preferences.dart';
import 'package:http/http.dart' as http;



chgNameForm(String name) async {
  String urlfin = baseurl + 'apiconfname-app';
  var url = Uri.parse(urlfin);
  
  Map data = {
    "uid"   : Preferences.uid,
    "name"   : name
  };
  
  //encode Map a JSON
  var body = jsonEncode(data);
  var response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
  ); 
  
  if (response.statusCode == 200) {
    return response.body;
  } else { 
    Map _res = { "log":"0"};
    var _reso = jsonEncode(_res);
    return _reso;
  }

  
}

chgApiForm(String apik, String apis) async {
  String urlfin = baseurl + 'apiconfpost-app';
  var url = Uri.parse(urlfin);
  
  Map data = {
    "uid"   : Preferences.uid,
    "apik"   : apik,
    "apis"  : apis
  };
  
  //encode Map a JSON
  var body = jsonEncode(data);
  var response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
  ); 
  
  return response.statusCode;
  
}


chgConfForm(int conf) async {
  String urlfin = baseurl + 'apiconfperms-app';
  var url = Uri.parse(urlfin);
  
  Map data = {
    "uid"   : Preferences.uid,
    "conf"   : conf,
  };
  
  //encode Map a JSON
  var body = jsonEncode(data);
  var response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
  ); 
  
  if (response.statusCode == 200) {
    return response.body;
  } else { 
    Map _res = { "log": 0 };
    var _reso = jsonEncode(_res);
    return _reso;
  }
  
}


