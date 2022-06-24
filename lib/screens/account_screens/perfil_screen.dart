import 'package:flutter/material.dart';

import '../../shared_preferences/preferences.dart';






class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB( 255, 199, 0, 57),
        centerTitle: true,
        title: Text(
          "Perfil de ${Preferences.name}",style: const TextStyle(
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
          child: Container(
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10) , 
              color: Colors.black
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),

                const Text(
                  "Para comenzar a utilizar el servicio del EliteBOTrading de Compra/Venta de activos debemos comenzar configurando nuestra ventana de CONFIGURACIÓN ahí.",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 10,),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 10,),
                
                const Text(
                  "En el caso de que no sepas que hacer te acompañamos que vayas a nuestra ventana de INFO. para que veas una guía completa de la configuración que debemos llevar a cabo desde 0 del BOT de Configuración.",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 10,),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 10,),

                const Text(
                  "Si ya tienes configurado correctamente todo ya podrá acceder a la ventana de BALANCES en la que podrás ver todos los balances que tienes en tu cuenta.",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 10,),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 10,),

                const Text(
                  "Y en nuestra ventana de ACERCA DE podrás ver la versión de EliteBOTrading.",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 10,),


              ]
            )

          ),
        ),
      )
    );
  }
}