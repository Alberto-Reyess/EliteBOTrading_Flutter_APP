import 'dart:async';
import 'dart:convert';
import 'package:elitebotrading/widgets/message_error.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:elitebotrading/main.dart';
import 'package:elitebotrading/shared_preferences/preferences.dart';



Future<Map<String, double>> apiGetBalSpot() async {
  String urlfin = baseurl + 'apigetbalancespot-app';
  var url = Uri.parse(urlfin);
  
  Map data = {
    "uid"   : Preferences.uid,
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
    Map apis = jsonDecode(response.body);
    List resull = apis['Results'];
    Map<String,double> fbal = {};
    for(var i = 0; i < resull.length; i++) {
      resull[i].forEach((symbol, qnty) {
        fbal[symbol] = qnty;
      });
    }
    return fbal;
  } else { 
    Map<String, double> balsspot = {
      "BTC" : 0.00,
      "ETH" : 0.00,
      "DOT" : 0.00,
      "MOVR" : 0.00,
    };
    MessageErrorShow.ShowSnackBar("Error, Debes configurar antes", Colors.red, Icons.warning);
    return balsspot;
  }
  
}




Future<Map<String, double>> apiGetBalFut() async {
  String urlfin = baseurl + 'apigetbalancefutures-app';
  var url = Uri.parse(urlfin);
  
  Map data = {
    "uid"   : Preferences.uid,
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
    Map apis = jsonDecode(response.body);
    List resull = apis['Results'];
    Map<String,double> fbal = {};
    for(var i = 0; i < resull.length; i++) {
      resull[i].forEach((symbol, qnty) {
        fbal[symbol] = qnty;
      });
    }
    return fbal;
  } else { 
    Map<String, double> balsspot = {
      "BTC" : 0.00,
      "ETH" : 0.00,
      "DOT" : 0.00,
      "MOVR" : 0.00,
    };
    MessageErrorShow.ShowSnackBar("Error, Debes configurar antes", Colors.red, Icons.warning);
    return balsspot;
  }
  

}


Future<Map<String, double>> apiGetTotalBal() async {
  String urlfin = baseurl + 'apigetbalancetotals-app';
  var url = Uri.parse(urlfin);
  
  Map data = {
    "uid"   : Preferences.uid,
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
    Map apiss = jsonDecode(response.body);
    print(apiss);
    Map<String,double> apis = {
      'TotalBalSpot' : apiss['TotalBalSpot'].toDouble(),
      'TotalBalFut'  : apiss['TotalBalFut'].toDouble(),
    };
    return apis;
    
  } else { 
    Map<String, double> balstotal = {
      "TotalBalSpot" : 0.00,
      "TotalBalFut" : 0.00,
    };
    MessageErrorShow.ShowSnackBar("Error, Debes configurar antes", Colors.red, Icons.warning);
    return balstotal;
  }
  
}