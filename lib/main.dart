import 'package:elitebotrading/screens/account_screens/balance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:elitebotrading/screens/homee_screen.dart';
import 'package:elitebotrading/widgets/message_error.dart';
import 'package:elitebotrading/screens/register_screen.dart';
import 'package:elitebotrading/screens/background.dart';
import 'package:elitebotrading/shared_preferences/preferences.dart';
import 'package:elitebotrading/screens/scroll_design.dart';
import 'package:elitebotrading/screens/login_screen.dart';

import 'dart:async';






void main() async { 

  WidgetsFlutterBinding.ensureInitialized();
  
  await Preferences.init();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EliteBOTrading',
      theme: ThemeData.dark(),
      initialRoute: 'scroll_screen' ,
      scaffoldMessengerKey: MessageErrorShow.messengerKey,
      routes: {
        'scroll_screen': ( _ ) => ScrollScreen(), 
        'login_screen' : ( _ ) => LoginScreen(),
        'signup_screen': ( _ ) => SignupScreen(),
        'bkgr_screen'  : ( _ ) => AnimatingBg1(),
        'hoome_page'   : ( _ ) => HomeePage(),

      },
    );
  }
}



//URL base, para todas las peticiones API
String baseurl = 'http://192.168.1.18:5000/api/v1/';





