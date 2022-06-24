
import 'package:elitebotrading/models/bottomNavigator.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import '../api/apiget_app.dart';
import '../api/criptoget_app.dart';
import '../shared_preferences/preferences.dart';
import '../widgets/card_table.dart';
import '../widgets/tarjetas_bot.dart';

import 'package:elitebotrading/pages/pages.dart';




  var currentIndex = 0;

class HomeePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomeePage> {
  List datos = [];
  List<bool> isTapped =[] ;//true
  List<bool> isExpanded = [];//false
  bool _isLoading = false;

  @override
  initState()  {
    super.initState();
    inicio();
    apiGetApp();
  }

  inicio() async {
    _isLoading = true;
    setState(() {});
    datos= await  getcrip();
    _isLoading = false;
    setState(() {});
  }

  backgroundfor1(){
    if (currentIndex == 0){
      return const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                image: DecorationImage(image: AssetImage('assets/background-2.png'),fit: BoxFit.cover),
      );
    }else {
      return  const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                image: DecorationImage(image: AssetImage('assets/background-onlylogo.png'), opacity: 0.4),
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 47, 47, 47),Color.fromARGB(255, 19, 19, 19)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
                ),
                //color: Color.fromARGB(255, 47, 47, 47),
              );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      top: true,
      right: false,
      bottom: false,
      child: Scaffold(
          backgroundColor: Colors.blueAccent,
          appBar: appBar(),
          
          body: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 13, left: 10, right: 10),
              decoration:  backgroundfor1(),
              child: Stack(
                children: [
                  showwidget(),
                  BottomNavigationBarwi(listOfIcons,updater,context,)
                ],
              ),
            ),
          ),
      ),
    );  
  }

  nameBar(){
    if (currentIndex == 0) {
          return Text(
        "${Preferences.name}'s Account",style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      );
    }else{
      if (currentIndex == 1) {
        return const Text(
          "Precios",style:  TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        );
      }else{
         if (currentIndex == 2) {
          return const Text(
            "Bot",style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          );
        }else{
          if (currentIndex == 3) {
            return const Text(
              "Configuración",style:  TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            );
          }
        }
      }
    }
  }


  appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
      title: nameBar(),
    );
  }

  void updater(){
    setState(() {});
  }

  showwidget() {
    double screenWidth = MediaQuery.of(context).size.width;
    if (currentIndex == 0) {
          return PaginaPerfil(screenWidth);
    }else{
      if (currentIndex == 1) {
        return Precio_page(screenWidth,tarjetas(datos,isTapped, isExpanded,  _isLoading,updater ),_isLoading);
      }else{
         if (currentIndex == 2) {
          return PaginaBot(screenWidth);
        }else{
          if (currentIndex == 3) {
            return PaginaConf(screenWidth,context);
          }
        }
      }
    }
  }





  

  PaginaPerfil(screenWidth){
    return Stack(
      children: [

        ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children:  [
            const CardTable(),
            SizedBox( height: screenWidth * .155 + 40),
          ],
        )

      ],
    );
  }
  









  PaginaBot(screenWidth){
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[

        const TarjetaBot(),

        SizedBox( height: screenWidth * .155 + 40),

      ],
    );
  }

  List<IconData> listOfIcons = [
    Icons.home,
    MdiIcons.chartBar,
    Icons.account_balance,
    Icons.settings_rounded
  ];

}


