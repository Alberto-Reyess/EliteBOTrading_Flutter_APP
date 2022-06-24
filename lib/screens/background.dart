import 'dart:async';
import 'package:flutter/material.dart';



class AnimatingBg1 extends StatefulWidget {
  @override
  _AnimatingBg1State createState() => _AnimatingBg1State();
}

class _AnimatingBg1State extends State<AnimatingBg1>
  with TickerProviderStateMixin {
  List<Color> colorList = [
    Color(0xff171B70),
    Color(0xff410D75),
    Color(0xff032340),
    Color(0xff050340),
    Color(0xff2C0340),
    Color(0xff581845),
  ];
  
  List<Alignment> alignmentList = [Alignment.topCenter, Alignment.bottomCenter];
  int index = 0;
  Color bottomColor = Color(0xff092646);
  Color topColor = Color(0xff410D75);
  Alignment begin = Alignment.bottomCenter;
  Alignment end = Alignment.topCenter;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(microseconds: 0),
      () {
        setState(
          () {
            bottomColor = Color(0xff33267C);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      onEnd: () {
        setState(
          () {
            index = index + 1;
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];
          },
        );
      },
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [bottomColor, topColor],
        ),
      ),







      child: 
        newMethod(context)
      
      
    );
  }

  Container newMethod(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(30) ,
        ),
        
        
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'login_screen'), 
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40,),
                  child: Text(
                    'Iniciar Sesión', 
                    style: TextStyle( 
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 30 
                    ) 
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255,17, 78, 158),
                  shape: const StadiumBorder(),
                  shadowColor: Colors.black,
                ),
              ),

              SizedBox(height: 30,),

              TextButton(
                onPressed: (){ Navigator.pushReplacementNamed(context, 'signup_screen'); }, 
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Crear Cuenta', 
                    style: TextStyle( 
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 30 
                    ) 
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 183, 42),
                  shape: const StadiumBorder(),
                  shadowColor: Colors.black,
                ),
              )
              


            ],
          ),
        ),
      );
  }

}