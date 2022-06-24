import 'dart:convert' ;
import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<List> getcrip() async {
  var url = Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=200&page=\$_itemPerPage&sparkline=false');
  print(url);
  
  var response = await http.get(url);
  List datos = jsonDecode(response.body);
  return datos;

  


}
