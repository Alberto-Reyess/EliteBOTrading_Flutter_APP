import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:elitebotrading/main.dart';
import 'package:elitebotrading/shared_preferences/preferences.dart';
import 'package:elitebotrading/widgets/message_error.dart';
import 'package:flutter/material.dart';


Future<List<Widget>> apiGetOperations()  async{
 String urlfin = baseurl + 'apigetoperations-app';
  var url = Uri.parse(urlfin);
  
  Map data = {
    "uid"   : 1,
  };
  
  //encode Map a JSON
  var body = jsonEncode(data);
  var response = await http.get(url); 
  
  List<Widget> operations = [];


  List<Widget> balsspot = [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text("BUY"),
        Text("0"),
        Text("0"),
        Text("0.00 %"),
      ],
    ),
  ];



  if (response.statusCode == 200) {
    Map apis = jsonDecode(response.body);
    List resull = apis['Results'];
    print(resull);
    for(var i = 0; i < resull.length; i++) {
      operations.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${resull[i][0]}"),
            Text("${resull[i][1]}"),
            Text("${resull[i][2]}"),
            Text("${resull[i][3]} %"),
          ],
        ),
      );
    }
    return operations;

  } else { 
    MessageErrorShow.ShowSnackBar("Error, Debes configurar antes", Colors.red, Icons.warning);
    return balsspot;
  }
  

}