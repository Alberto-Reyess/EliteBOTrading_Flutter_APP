import 'package:elitebotrading/models/cerrar_sesion.dart';
import 'package:elitebotrading/screens/homee_screen.dart';
import 'package:elitebotrading/widgets/message_error.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



/*
PaginaConf () {

    return const Center(
      child: Text("Configuración", style: TextStyle(fontSize: 30,color: Colors.white),),

    );
  
}*/


PaginaConf(screenWidth,context ){
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20) ,
      children: <Widget>[
        
        //const Text("Configuración", style: TextStyle(fontSize: 30,color: Colors.white,), textAlign: TextAlign.center,),
        
        SizedBox(height: 30),

        ElevatedButton.icon(
          label: const Text("Cerrar Sesion"),
          onPressed: () {
            logout();
            MessageErrorShow.ShowSnackBar("Se cerrado correctamente la sesión", Colors.red , Icons.exit_to_app);
            Navigator.pushReplacementNamed(context, 'scroll_screen');
            currentIndex = 0;

          } ,
          icon: const Icon(MdiIcons.logout),
          style: ElevatedButton.styleFrom(
              primary: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        TextButton(
          onPressed: () {
            showAboutDialog(context: context);
          }, 
          child: const Text("Ver Licencias")
        ),
        
        
            
        
        SizedBox( height: screenWidth * .155 + 40)
      ],
    );
  }