import 'dart:convert';

import 'package:flutter/material.dart';


import '../../forms/confs_forms.dart';
import '../../shared_preferences/preferences.dart';
import 'package:google_fonts/google_fonts.dart';




class ChgApiConfigScreen extends StatefulWidget {
  const ChgApiConfigScreen({Key? key}) : super(key: key);

  @override
  State<ChgApiConfigScreen> createState() => _ChgApiConfigScreenState();
}



class _ChgApiConfigScreenState extends State<ChgApiConfigScreen> {

  static bool _isLoading = false;
  TextEditingController? controladorApis;
  TextEditingController? controladorApik;
   
  @override
  void initState() {
    super.initState();
     controladorApik =  TextEditingController(text: "${Preferences.apik}" ) ;
     controladorApis =  TextEditingController(text: "${Preferences.apis}" ) ;
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
                  "Cambia Conf. API",
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
                        decoration: InputDecoration(
                          
                          hintText: 'API key',
                        ),
                        controller: controladorApik,
                        validator: ( value ) {

                          return ( value != null && value.length > 6 ) 
                            ? null
                            : 'La contraseña debe de ser de 6 caracteres';                                    
                  
                        },
                      ),
              ),
              SizedBox(height: 10,),
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
                        decoration: InputDecoration(
                          hintText: 'API secret',
                        ),
                        controller: controladorApis,
                        validator: ( value ) {

                          return ( value != null && value.length > 6 ) 
                            ? null
                            : 'La contraseña debe de ser de 6 caracteres';                                    
                  
                        },
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
                        : const Text('Guardar Conf.',
                        style: TextStyle( color: Colors.white ),
                      )
                    ),
                    onPressed: _isLoading ? null : () async {

                      _isLoading = true;
                      setState(() {});
                      
                      FocusScope.of(context).unfocus();
                      if (controladorApik!.text == "" || controladorApis!.text == "" ) { await Future.delayed(Duration(seconds: 2 )); 
                        setState(() {
                          Future.delayed(Duration(seconds: 2 ));
                          _isLoading = false;
                        });
                      }else{
                        await Future.delayed(Duration(seconds: 2 ));
                        await chgApiForm(controladorApik!.text,controladorApis!.text).then((value) {

                          if(value == 200){
                            Preferences.apik= controladorApik!.text;
                            Preferences.apis= controladorApis!.text;
                            Navigator.pop(context);
                            _isLoading = false;
                            setState(() {});
                          } else {
                            _isLoading = false;
                            setState(() {});
                          }
                        });
                      }  
                    },
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