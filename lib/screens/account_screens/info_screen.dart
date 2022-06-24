import 'package:flutter/material.dart';

import '../../shared_preferences/preferences.dart';






class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Colors.green,
        centerTitle: true,
        title: const Text(
          "Información",style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),


      body: Center(
        child: Container(
          decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/background-onlylogo.png'), opacity: 0.4),
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 47, 47, 47),Color.fromARGB(255, 19, 19, 19)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
                ),
          ),
        ),
      )
    );
  }
}