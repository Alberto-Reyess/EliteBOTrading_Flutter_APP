import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../shared_preferences/preferences.dart';
import '../forms_sccreens/chg_api_conf_screen.dart';
import '../forms_sccreens/chg_name_screen.dart';
import '../forms_sccreens/chg_perm_bot_screen.dart';




class ConfigScreen extends StatefulWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: const Text(
          "Configuración",style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),


      body: Center(
        child: Container(
          decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 47, 47, 47),Color.fromARGB(255, 19, 19, 19)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
                ),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
            
            
                  const SizedBox(height: 20),
            
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        child: Container(
                          width: 10.0,
                          height: 50.0,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Flexible(
                        child: Text(
                          'NOMBRE',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ChgNameConfigScreen())).then((value) {
                      setState(() {});
                    }),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(left: 20, right: 20,),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${Preferences.name}",style: const TextStyle(
                            fontSize: 20,
                          ),),
                        ],
                      ),
                    ),
                  ),
            
            
            
            
            
                  //Conf API ############################
                  SizedBox(height: 50,),
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        child: Container(
                          width: 10.0,
                          height: 50.0,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Flexible(
                        child: Text(
                          'APIs CONF.',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ChgApiConfigScreen())).then((value) {
                      setState(() {});
                    }),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(left: 20, right: 20,),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "${Preferences.apik}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ChgApiConfigScreen())).then((_) => setState(() {})),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(left: 20, right: 20,),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "${Preferences.apis}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //END Conf API ############################
            
            
                  
                  //Conf BOT PERMISSION ############################
                  SizedBox(height: 50,),
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        child: Container(
                          width: 10.0,
                          height: 50.0,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Flexible(
                        child: Text(
                          'Permisos eBOT',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ChgBotPermgScreen())).then((_) => setState(() {})),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 20, right: 20,),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 80,
                      child: botPermission(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //END Conf BOT PERMISSION ############################
            
            
                ]
              ),
            ],
          ) 
        ),
      )
    );
  }

  Widget botPermission() {
    if (Preferences.conf == 1) {
      return const Icon(
        MdiIcons.checkBold,
        size: 60,
        color: Colors.green,
      );
    } else {
      return const Icon(
        MdiIcons.closeThick,
        size: 60,
        color: Colors.red,
      );
    }
  }
  


}