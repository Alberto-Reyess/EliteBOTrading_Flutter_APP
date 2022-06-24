import 'package:flutter/material.dart';

ListView Precio_page(double screenWidth,List<Widget> tarjetas, bool _isLoading) {
  return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 25),
        
        ...!_isLoading
          ? tarjetas
          : [Center(child: CircularProgressIndicator())],
        
        SizedBox(height: screenWidth * .155 + 40,)
        
        
      ]);
}




  
List<Widget> tarjetas(List datos, List<bool> isTapped, List<bool> isExpanded, bool _isLoading ,Function updater) {
  
  List<Widget> resultado = [];

  for(Map moneda in datos){/*
    resultado.add(Card(child: ListTile(title: Text(moneda["name"]),subtitle: Text(moneda["current_price"].toString()), ),));
    resultado.add(SizedBox(height: 15,));*/
    isTapped.add(true);
    isExpanded.add(false);

    getcolor(){
    if(moneda["price_change_24h"]< 0) {
      return (isTapped[datos.indexOf(moneda)]
        ? BoxShadow(
                    color: Color.fromARGB(46, 255, 0, 0).withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
        : BoxShadow(
                    color: Color.fromARGB(255, 141, 1, 1).withOpacity(0.9),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
      );

    }else {
      return (isTapped[datos.indexOf(moneda)] 
        ? BoxShadow(
                    color: Color.fromARGB(46, 34, 255, 0).withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
        : BoxShadow(
                    color: Color.fromARGB(255, 14, 106, 0).withOpacity(0.9),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
      );
    }
    };

    resultado.add(InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
                isTapped[datos.indexOf(moneda)] = !isTapped[datos.indexOf(moneda)];
              updater();
            },
            onHighlightChanged: (value) {

                isExpanded[datos.indexOf(moneda)] = value;
              updater();
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              //curve: Curves.fastLinearToSlowEaseIn,
              height:
                  isTapped[datos.indexOf(moneda)] ? isExpanded[datos.indexOf(moneda)] ? 65 : 70 : isExpanded[datos.indexOf(moneda)] ? 225 : 330,
              width: isExpanded[datos.indexOf(moneda)] ? 385 : 390,
              decoration:  BoxDecoration(
                color: Color.fromARGB(105, 82, 82, 82),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  getcolor(),
                ]
              ),
              padding: EdgeInsets.all(20),
              child: isTapped[datos.indexOf(moneda)]
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            CircleAvatar(
                              backgroundColor: Color.fromARGB(0, 119, 136, 153),
                              backgroundImage: NetworkImage("${moneda["image"]}"),
                              radius: 15,
                            ),
                            Text(
                              '${moneda["name"]} : ${moneda["current_price"].toString()} \$',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.right,
                            ),
                            
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("${moneda["image"]}"),
                              backgroundColor: Color.fromARGB(0, 119, 136, 153),
                              radius: 15,
                            ),
                            Text(
                              '${moneda["name"]} : ${moneda["current_price"].toString()} \$',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.right,
                            ),
                            Icon(
                              isTapped[datos.indexOf(moneda)]
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 27,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          isTapped[datos.indexOf(moneda)]
                              ? ''
                              : 'Capitalización de mercado:      ${moneda["market_cap"]}  \$ \n\n'
                                'Máximo Histórico:      ${moneda["ath"]}  \$ \n\n'
                                'Últimas 24h:      ${moneda["price_change_percentage_24h"]}  % \n\n'
                                'Alto 24h:      ${moneda["high_24h"]}  % \n\n'
                                'Bajo 24h:      ${moneda["low_24h"]}  % \n\n',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
            ),
          ),);

      resultado.add(SizedBox(height: 15,));

  }
  return resultado;
}