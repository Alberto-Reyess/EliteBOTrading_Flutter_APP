import 'package:elitebotrading/screens/homee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/haptic_feedback.dart';



BottomNavigationBarwi(listOfIcons,updater,context){
  double screenWidth = MediaQuery.of(context).size.width;
  return Positioned(
    bottom: 10,
    right: 0,
    left: 0,
    child: Container(
        margin: EdgeInsets.all(8),
        height: screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 47, 47, 47),
              blurRadius: 80,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              currentIndex = index;
              HapticFeedback.lightImpact();
              updater();
              
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: screenWidth * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? screenWidth * .12 : 0,
                      width: index == currentIndex ? screenWidth * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.blueAccent.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
              ),
                Container(
                  width: screenWidth * .2125,
                  alignment: Alignment.center,
                  child: Icon(
                    listOfIcons[index],
                    size: screenWidth * .076,
                    color: index == currentIndex
                        ? Colors.blueAccent
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
    ),
  );
  
}