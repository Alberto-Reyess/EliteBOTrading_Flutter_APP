import 'dart:convert';

import 'package:elitebotrading/forms/login_signup_form.dart';
import 'package:elitebotrading/shared_preferences/preferences.dart';
import 'package:elitebotrading/widgets/message_error.dart';
import 'package:flutter/material.dart';

import '../ui/input_decorations.dart';
import '../widgets/auth_background.dart';
import '../widgets/card_container.dart';


class LoginScreen extends StatefulWidget {



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  static bool _isLoading = false;
  TextEditingController? controladorEmail;
  TextEditingController? controladorPasswd;

  @override
  void initState() {
     controladorEmail =  TextEditingController(text: "" ) ;
     controladorPasswd =  TextEditingController(text: "" ) ;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox( height: 250 ),
              

              CardContainer(
                child: Column(
                  children:  [
                    const Text("Iniciar Sesión", style: TextStyle(color: Colors.black, fontSize: 25)),
                    Column( children: [





                      SizedBox(height: 30),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: controladorEmail,
                        decoration: InputDecorations.authInputDecoration(
                          hintText: "tu.correo@gmail.com", 
                          labelText: "Correo electronico",
                          prefixIcon: Icons.alternate_email_rounded
                        ),
                        validator: ( value ) {

                          String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp  = new RegExp(pattern);
                  
                          return regExp.hasMatch(value ?? '')
                          ? null
                          : 'El valor ingresado no luce como un correo';

                        },
                      ),

                      const SizedBox(height: 30),

                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        autocorrect: false,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecorations.authInputDecoration(
                          hintText: '*****',
                          labelText: 'Contraseña',
                          prefixIcon: Icons.lock_outline
                        ),
                        controller: controladorPasswd,
                        validator: ( value ) {

                          return ( value != null && value.length > 6 ) 
                            ? null
                            : 'La contraseña debe de ser de 6 caracteres';                                    
                  
                        },
                      ),                    




                      const SizedBox(height: 40,),

                      MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        disabledColor: Colors.grey,
                        elevation: 10,
                        color: const Color.fromARGB(255, 17, 78, 158),
                        child: Container(
                          padding: const EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                          child: _isLoading ?  CircularProgressIndicator()
                            : const Text('Ingresar',
                            style: TextStyle( color: Colors.white ),
                          )
                        ),
                        onPressed: _isLoading ? null : () async {

                          _isLoading = true;
                          setState(() {});
                          
                          FocusScope.of(context).unfocus();
                          if (controladorEmail!.text == "" || controladorPasswd!.text == ""){ await Future.delayed(Duration(seconds: 2 )); setState(() {
                            MessageErrorShow.ShowSnackBar("Error al introducir parametros", Colors.red, Icons.warning);
                            _isLoading = false;
                          });}else{
                            await loginForm(controladorEmail!.text,controladorPasswd!.text).then((value) {
                              Map _answ = jsonDecode(value);
                              int _log = _answ['log'];
                              

                              

                              if(_log == 1){
                                Preferences.email= controladorEmail!.text;
                                Preferences.uid= _answ['uid'];
                                Preferences.name= _answ['name'];
                                MessageErrorShow.ShowSnackBar("Se ha iniciado correctamente la sesión", Colors.green , Icons.check);
                                Navigator.pushReplacementNamed(context, 'hoome_page');
                              } else {
                                MessageErrorShow.ShowSnackBar("Error al introducir parametros", Colors.red, Icons.warning);
                                _isLoading = false;
                                setState(() {});
                              }
                              
                              /*
                              String gotaccess = value;
                              if(gotaccess == true) {
                                Navigator.pushReplacementNamed(context, 'home_screen');
                              }else { return "Intentelo de nuevo";}*/
                              
                              
                              _isLoading = false;
                              setState(() {});

                            });
                          }
                          
                        }
                      ),

                      const SizedBox( height: 10 ),

                      TextButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Crear Cuenta', 
                            style: TextStyle( 
                                color: Color.fromARGB(255, 255, 255, 255),
                            ) 
                          ),
                        ),
                        style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: const Color.fromARGB(255, 66, 183, 42),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: (){ Navigator.pushReplacementNamed(context, 'signup_screen'); }
                      )




                    ],)
                  ],
                )
              ),
              SizedBox( height: 100 ),
            ],
          ),
        )
      )
   );
  }
}



