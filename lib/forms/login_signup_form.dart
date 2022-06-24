import 'dart:convert';
import 'dart:async';

import 'package:elitebotrading/main.dart';
import 'package:http/http.dart' as http;



loginForm(String email, String passwd) async {
  //var url = Uri.parse('http://34.140.81.76:5000/api/v1/login-app');
  /*var baseurl = 'http://' + ip + '/ip/api/v1/login-app';
  var url = Uri.parse(baseurl);*/
  String urlfin = baseurl + 'login-app';
  var url = Uri.parse(urlfin);

  print(url);
  
  
  Map data = {
    "email"   : email,
    "passwd"  : passwd
  };
  
  //encode Map a JSON
  var body = jsonEncode(data);
  print(body);
  var response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
  ); 
  
  if (response.statusCode == 200) {
    return response.body;
  } else { 
    Map _res = { "log":"false","uid":0,"name":"","message":"Error en los parametros"};
    var _reso = jsonEncode(_res);
    await Future.delayed(Duration(seconds: 2 ));
    return _reso;
  }
  
}


signupForm(String name, String email, String passwd) async {
  String urlfin = baseurl + 'signup-app';
  var url = Uri.parse(urlfin);
  //var url = Uri.parse('http://34.140.81.76:5000/api/v1/signup-app');
  /*var baseurl = 'http://' + ip + '/ip/api/v1/login-app';
  var url = Uri.parse(baseurl);*/

  print(url);
  
  
  Map data = {
    "name"    : name,
    "email"   : email,
    "passwd"  : passwd
  };
  
  //encode Map a JSON
  var body = jsonEncode(data);
  print(body);
  var response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
  ); 
  
  if (response.statusCode == 200) {
    return response.body;
  } else { 
    Map _res = { "log":0};
    var _reso = jsonEncode(_res);
    await Future.delayed(Duration(seconds: 2 ));
    return _reso;
  }

}