import 'dart:convert';
import 'dart:async';
import 'dart:developer';

import 'package:elitebotrading/main.dart';
import 'package:elitebotrading/shared_preferences/preferences.dart';
import 'package:http/http.dart' as http;



apiGetApp() async {
  String urlfin = baseurl + 'apiget-app';
  var url = Uri.parse(urlfin);
  
  Map data = {
    "uid"   : Preferences.uid
  };
  
  //encode Map a JSON
  var body = jsonEncode(data);
  log(body);
  var response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
  ); 
  
  if (response.statusCode == 200) {
    Map apis = jsonDecode(response.body);
    Preferences.apik = apis["apik"];
    Preferences.apis = apis["apis"];
    Preferences.conf = apis["conf"];
  } else { 
    await Future.delayed(const Duration(seconds: 2 ));
    return Exception('Failed');
  }
  
}








