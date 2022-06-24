import 'package:elitebotrading/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';






class ContactScreen extends StatefulWidget {

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController? controladorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    controladorMessage =  TextEditingController(text: "" ) ;
    bool _isLoading = true;
    super.initState();
    inicio();
  }

  inicio() {
    bool _isLoading = false;
    setState(() {});
  }

  void customLaunch(command) async {
    if (await canLaunchUrl(command)) {
      await launchUrl(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "Contacto",style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),


      body:  Center(
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
                  "Coctacto",
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
                          hintText: 'Explicanos tu problema o el error encontrado',
                        ),
                        controller: controladorMessage,
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
                        : const Text('Volver',
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
                        : const Text('Enviar email',
                        style: TextStyle( color: Colors.white ),
                      )
                    ),
                    onPressed: _isLoading ? null : () async {

                      _isLoading = true;
                      setState(() {});
                      
                      FocusScope.of(context).unfocus();
                      if (controladorMessage!.text == "" ){ 
                        await Future.delayed(Duration(seconds: 2 )); setState(() {
                          Future.delayed(Duration(seconds: 2 ));
                          _isLoading = false;
                          setState(() {});
                        });
                      }else{  
                        await Future.delayed(Duration(seconds: 2 ));
                        setState(() {});
                        customLaunch(
                        Uri.parse('mailto:elitebotrading.oficial@gmail.com?subject=Support%20~${Preferences.name}&body=${controladorMessage!.text}'));
                          
                        _isLoading = false;

                        
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
