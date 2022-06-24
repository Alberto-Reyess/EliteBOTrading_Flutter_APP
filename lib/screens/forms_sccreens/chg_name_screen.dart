import 'dart:convert';

import 'package:elitebotrading/forms/confs_forms.dart';
import 'package:elitebotrading/widgets/message_error.dart';
import 'package:flutter/material.dart';


import '../../shared_preferences/preferences.dart';
import 'package:google_fonts/google_fonts.dart';




class ChgNameConfigScreen extends StatefulWidget {
  const ChgNameConfigScreen({Key? key}) : super(key: key);

  @override
  State<ChgNameConfigScreen> createState() => _ChgNameConfigScreenState();
}



class _ChgNameConfigScreenState extends State<ChgNameConfigScreen> {

  static bool _isLoading = false;
  TextEditingController? controladorName;
   
  @override
  void initState() {
    super.initState();
     controladorName =  TextEditingController(text: "${Preferences.name}" ) ;
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
                  "Cambia tu nombre",
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
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 20, right: 20,),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 47, 47, 47),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 80,
                child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        autocorrect: false,
                        obscureText: false,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          hintText: 'Nombre',
                        ),
                        controller: controladorName,
                      ),
              ),
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
                        : const Text('Cambiar Nombre',
                        style: TextStyle( color: Colors.white ),
                      )
                    ),
                    onPressed: _isLoading ? null : () async {

                      _isLoading = true;
                      setState(() {});
                      
                      FocusScope.of(context).unfocus();
                      if (controladorName!.text == "" ){ 
                        await Future.delayed(Duration(seconds: 2 )); setState(() {
                          Future.delayed(Duration(seconds: 2 ));
                          _isLoading = false;
                        });
                      }else{  
                        await Future.delayed(Duration(seconds: 2 ));
                        var respuesta =await chgNameForm(controladorName!.text).then((value) { 
                          Map _answ = jsonDecode(value);
                          int _log = _answ['log'];

                          

                          if(_log == 1){
                            Preferences.name= controladorName!.text;
                            MessageErrorShow.ShowSnackBar("Se ha cambiado correctamente", Colors.green , Icons.check);
                            Navigator.pop(context);
                          } else {
                            _isLoading = false;
                            setState(() {});
                          }
                          
                          _isLoading = false;

                        });
                        setState(() {});
                      }
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