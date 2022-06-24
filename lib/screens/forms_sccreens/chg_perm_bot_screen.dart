import 'dart:convert';

import 'package:elitebotrading/forms/confs_forms.dart';
import 'package:elitebotrading/widgets/message_error.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import '../../shared_preferences/preferences.dart';
import 'package:google_fonts/google_fonts.dart';




class ChgBotPermgScreen extends StatefulWidget {
  const ChgBotPermgScreen({Key? key}) : super(key: key);

  @override
  State<ChgBotPermgScreen> createState() => _ChgBotPermgScreenState();
}



class _ChgBotPermgScreenState extends State<ChgBotPermgScreen> {

  static bool _isLoading = false;
  int btncontrol = Preferences.conf;
  
  botoncontrolador() {
    if (btncontrol == 1 ) {
      return const Icon(
        MdiIcons.checkboxMarked,
        size: 80,
        color: Colors.green,
      );
    } else {
      return const Icon(
        MdiIcons.closeBox,
        size: 80,
        color: Colors.red,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    botoncontrolador();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Permisos eBOT",
                  textAlign: TextAlign.left, 
                  style: GoogleFonts.robotoCondensed(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Colors.white, 
                      fontSize: 35,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                width: MediaQuery.of(context).size.width - 40 ,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(left: 20, right: 20,),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 47, 47, 47),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 80,
                  child: IconButton(
                    icon: botoncontrolador(),
                    onPressed: () {
                      setState(() {});
                      if (btncontrol == 1 ) {
                        btncontrol = 0;
                        print(btncontrol);
                      } else {
                        btncontrol = 1;
                        print(btncontrol);
                      }
                
                    },
                  ),
                )
              ),
              SizedBox(height: 10,),


              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 10,
                    color: Color.fromARGB(255, 123, 125, 125),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: _isLoading ?  CircularProgressIndicator()
                        : const Text('Cancelar',
                        style: TextStyle( color: Colors.white ),
                      )
                    ),
                    onPressed: _isLoading ? null : () async {
                      setState(() {});
                      FocusScope.of(context).unfocus();
                      Navigator.pop(context);
                    },
                  ),




                  MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 10,
                    color: Color.fromARGB(255, 0, 198, 238),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: _isLoading ?  CircularProgressIndicator()
                        : const Text('Guardar Conf.',
                        style: TextStyle( color: Colors.white ),
                      )
                    ),
                    onPressed: _isLoading ? null : () async {

                      _isLoading = true;
                      setState(() {});
                      FocusScope.of(context).unfocus();
                      
                      var response = await chgConfForm(btncontrol);
                          Map _answ = jsonDecode(response);
                          int _log = _answ['log'];

                          

                          if(_log == 1){
                            Preferences.conf = btncontrol;
                            _isLoading = false;
                            MessageErrorShow.ShowSnackBar("Permisos cambiados correctamente", Colors.green, Icons.check);
                            setState(() {});
                            Navigator.pop(context);
                          } else {
                            Preferences.conf = 0;
                            _isLoading = false;
                            MessageErrorShow.ShowSnackBar("Error", Colors.red, Icons.warning);
                            setState(() {});
                          }
                          
                          
                          
                      
                          setState(() {});
                          _isLoading = false;
                      
                    }
                  ),
                ],
              )
              

              

            ]
          ) 
        ),
      )
    );
  }
}