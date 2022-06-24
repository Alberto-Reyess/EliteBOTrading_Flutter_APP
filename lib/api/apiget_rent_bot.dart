import 'dart:async';
import 'dart:convert';
import 'package:elitebotrading/widgets/message_error.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:elitebotrading/main.dart';


Future<Map> getrentbot() async {
  /*var url = Uri.parse('http://http://34.140.81.76:5000/api/v1/bot-rent-app');
  
  var baseurl = 'http://' + ip + '/ip/api/v1/bot-rent-app';
  var url = Uri.parse(baseurl);
  
  if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    return data;
  } else { 
    Map datos = {
      "ayer"   : 0.0 ,
      "semana"  : 0.0 ,
      "mes"  : 0.0 ,
      "3meses"  : 0.0 ,
      "ano"  : 0.0 ,
    };
    await Future.delayed(Duration(seconds: 2 ));
    return datos;
  }
  
  */

  Map datos = {
    "ayer"   : -3.25 ,
    "semana"  : -8.54 ,
    "mes"  : 62.84 ,
    "3meses"  : 94.57 ,
    "ano"  : 94.57 ,
  };

  return datos;
}



Future<Map> getrentbotdatos() async {
  String urlfin = baseurl + 'apigetrents-app';
  var url = Uri.parse(urlfin);
  
  //encode Map a JSON
  var response = await http.get(url,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }); 
  

  Map datos = {
    'semana' :
    [0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,],
    'mes' :
    [0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,],
    'trmes' :
    [0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,
    0.0 ,]
  };



  if (response.statusCode == 200) {
    Map apis = jsonDecode(response.body);
    return apis;

  } else { 
    MessageErrorShow.ShowSnackBar("Error, Debes configurar antes", Colors.red, Icons.warning);
    return datos;
  }


}




Future<Map<String,double>> getrentbotmes() async {
  var url = Uri.parse('http://http://34.140.81.76:5000/api/v1/bot-rentmes-app');
  
  /*var baseurl = 'http://' + ip + '/ip/api/v1/bot-rentmes-app';
  var url = Uri.parse(baseurl);
  
  if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    return data;
  } else { 
    Map datos = {
      "ayer"   : 0.0 ,
      "semana"  : 0.0 ,
      "mes"  : 0.0 ,
      "3meses"  : 0.0 ,
      "ano"  : 0.0 ,
    };
    await Future.delayed(Duration(seconds: 2 ));
    return datos;
  }
  
  */

  Map<String,double> datos = {
    '26': 1.5,
    '27': 1.5,
    '28': 1.5,
    '29': 1.5,
    '30': 2,
    '31': 0.5,
    '01': 4,
    '02': -4,
    '03': 4.5,
    '04': -1,
    '05': -4,
    '06': 4,
    '07': -4,
    '08': 4.5,
    '09': -1,
    '10': -4,
    '11': 0.5,
    '12': 4,
    '13': -4,
    '14': 4.5,
    '15': -1,
    '16': -4,
    '17': 4,
    '18': -4,
    '19': 4.5,
    '20': -1,
    '21': -4,
    '22': 4,
    '23': -4,
    '24': 4.5,
    '25': -1,
  };

  return datos;

}




Future<Map<String,double>> getrentbottresmes() async {
  var url = Uri.parse('http://http://34.140.81.76:5000/api/v1/bot-renttresmes-app');
  
  /*var baseurl = 'http://' + ip + '/ip/api/v1/bot-renttresmes-app';
  var url = Uri.parse(baseurl);
  
  if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    return data;
  } else { 
    Map datos = {
      "ayer"   : 0.0 ,
      "semana"  : 0.0 ,
      "mes"  : 0.0 ,
      "3meses"  : 0.0 ,
      "ano"  : 0.0 ,
    };
    await Future.delayed(Duration(seconds: 2 ));
    return datos;
  }
  
  */

  Map<String,double> datos = {
    '26/2': 1.5,
    '27/2': 1.5,
    '28/2': 1.5,
    '29/2': 1.5,
    '30/2': 2,
    '31/2': 0.5,
    '01/3': 4,
    '02/3': -4,
    '03/3': 4.5,
    '04/3': -1,
    '05/3': -4,
    '06/3': 4,
    '07/3': -4,
    '08/3': 4.5,
    '09/3': -1,
    '10/3': -4,
    '11/3': 0.5,
    '12/3': 4,
    '13/3': -4,
    '14/3': 4.5,
    '15/3': -1,
    '16/3': -4,
    '17/3': 4,
    '18/3': -4,
    '19/3': 4.5,
    '20/3': -1,
    '21/3': -4,
    '22/3': 4,
    '23/3': -4,
    '24/3': 4.5,
    '25/3': -1,
    '26/3': 1.5,
    '27/3': 1.5,
    '28/3': 1.5,
    '29/3': 1.5,
    '30/3': 2,
    '31/3': 0.5,
    '01/4': 4,
    '02/4': -4,
    '03/4': 4.5,
    '04/4': -1,
    '05/4': -4,
    '06/4': 4,
    '07/4': -4,
    '08/4': 4.5,
    '09/4': -1,
    '10/4': -4,
    '11/4': 0.5,
    '12/4': 4,
    '13/4': -4,
    '14/4': 4.5,
    '15/4': -1,
    '16/4': -4,
    '17/4': 4,
    '18/4': -4,
    '19/4': 4.5,
    '20/4': -1,
    '21/4': -4,
    '22/4': 4,
    '23/4': -4,
    '24/4': 4.5,
    '25/4': -1,
    '26/4': 1.5,
    '27/4': 1.5,
    '28/4': 1.5,
    '29/4': 1.5,
    '30/4': 2,
    '31/4': 0.5,
    '01/5': 4,
    '02/5': -4,
    '03/5': 4.5,
    '04/5': -1,
    '05/5': -4,
    '06/5': 4,
    '07/5': -4,
    '08/5': 4.5,
    '09/5': -1,
    '10/5': -4,
    '11/5': 0.5,
    '12/5': 4,
    '13/5': -4,
    '14/5': 4.5,
    '15/5': -1,
    '16/5': -4,
    '17/5': 4,
    '18/5': -4,
    '19/5': 4.5,
    '20/5': -1,
    '21/5': -4,
    '22/5': 4,
    '23/5': -4,
    '24/5': 4.5,
    '25/5': -1,
  };

  return datos;

}








