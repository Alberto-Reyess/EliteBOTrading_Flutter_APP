import 'dart:ui';

import 'package:elitebotrading/api/apiget_balances.dart';
import 'package:elitebotrading/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


import '../../shared_preferences/preferences.dart';





class BalanceScreen extends StatefulWidget {

 

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {

  TooltipBehavior? _tooltipBehavior;
  TooltipBehavior? _tooltipBehavior2;
  bool _isLoading = false;
  int _count = 0;
  List<ChartData> chartDataBalSpot = [];
  late Map<String,double> balSpot;
  List<Color> ramco = ramdomColors();
  List<ChartData> chartDataBalFut = [];
  late Map<String,double> balFut;
  List<Color> ramco2 = ramdomColors();
  late Map<String,double> totalbal;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _tooltipBehavior2 = TooltipBehavior(enable: true);
    inicio();
    _isLoading = true;
  }

  Future inicio() async {
    _isLoading = true;
    setState(() {});
    totalbal = await apiGetTotalBal();
    balSpot= await apiGetBalSpot();
    balSpot.forEach((key, double value) {
      chartDataBalSpot.add(ChartData(key, value,ramco[_count]),);
      _count = _count + 1 ;
    });
    balFut= await apiGetBalFut();
    balFut.forEach((key, double value) {
      chartDataBalFut.add(ChartData(key, value,ramco[_count]),);
      _count = _count + 1 ;
    });

    _isLoading = false;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    late List<ChartData> chartDataSpot = chartDataBalSpot;
    late List<ChartData> chartDataFut = chartDataBalFut;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Balance de ${Preferences.name}",style: const TextStyle(
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
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                  
                  Container(
                    decoration: const BoxDecoration( 
                      borderRadius:BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.only(left:20,right:20,top: 20),
                    height:  MediaQuery.of(context).size.height * 0.3,
                    child: !_isLoading
                      ? SfCircularChart(
                          margin: const EdgeInsets.all(5),
                          tooltipBehavior: _tooltipBehavior,
                          // Chart title text
                          title: ChartTitle(text: 'Spot Balance % in USD',textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
                          series: <CircularSeries>[
                          // Render pie chart
                            PieSeries<ChartData, String>(
                              enableTooltip: true, 
                              dataSource: chartDataSpot,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              dataLabelSettings:const DataLabelSettings(isVisible : true,color: Colors.black),
                              pointColorMapper: (ChartData data,_) => data.color,
                            )
                          ]
                        )
                      : const Center(child: CircularProgressIndicator()),
                   
                  ),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.only(left:20,right:20),
                    color: Colors.black,
                  ),
                  Container(
                    decoration: const BoxDecoration( 
                      borderRadius:BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.only(left:20,right:20),
                    padding: const EdgeInsets.only(top:10),
                    height:  MediaQuery.of(context).size.height * 0.3,
                    child: !_isLoading
                      ? SfCircularChart(
                          margin: const EdgeInsets.all(5),
                          tooltipBehavior: _tooltipBehavior2,
                          // Chart title text
                          title: ChartTitle(text: 'Futures Balance % in USD',textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
                          series: <CircularSeries>[
                          // Render pie chart
                            PieSeries<ChartData, String>(
                              enableTooltip: true, 
                              dataSource: chartDataFut,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              dataLabelSettings:const DataLabelSettings(isVisible : true,color: Colors.black),
                              pointColorMapper: (ChartData data,_) => data.color,
                            )
                          ]
                        )
                      : const Center(child: CircularProgressIndicator()),
                    
                    
                    
                  ),

                  Container(
                    margin: const EdgeInsets.only(top:30,left:20, right: 20,),
                    padding: const EdgeInsets.only(top:20,bottom: 20),
                    decoration: const BoxDecoration( 
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                              child: Container(
                                width: 10.0,
                                height: 50.0,
                                color: Colors.indigo,
                              ),
                            ),
                            const Flexible(
                              child: Text(
                                'Balance Spot in \$',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.indigo,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                              ),
                              child: Container(
                                width: 10.0,
                                height: 50.0,
                                color: Colors.indigo,
                              ),
                            ),
                          ],
                        ),
                        
                        ...!_isLoading
                        ? [Text(
                            '${totalbal['TotalBalSpot']}',
                            style: const TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),]
                        : [const Center(child: CircularProgressIndicator())],

                        

                        

                        
                        const SizedBox(height: 12,),


                        //Bal FUT
                        Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                              child: Container(
                                width: 10.0,
                                height: 50.0,
                                color: Colors.indigo,
                              ),
                            ),
                            const Flexible(
                              child: Text(
                                'Balance Futuros in \$',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.indigo,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                              ),
                              child: Container(
                                width: 10.0,
                                height: 50.0,
                                color: Colors.indigo,
                              ),
                            ),
                          ],
                        ),


                        ...!_isLoading
                        ? [Text(
                            '${totalbal['TotalBalFut']}',
                            style: const TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          )]
                        : [const Center(child: CircularProgressIndicator())],
                        

                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top:30,left:20, right: 20,),
                    padding: const EdgeInsets.only(top:20,bottom: 20),
                    decoration: const BoxDecoration( 
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                              child: Container(
                                width: 10.0,
                                height: 50.0,
                                color: Colors.red,
                              ),
                            ),
                            const Flexible(
                              child: Text(
                                'SPOT ASSETS',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.red,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                              ),
                              child: Container(
                                width: 10.0,
                                height: 50.0,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("SÍMBOLO",style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                              Text("|"),
                              Text("CANTIDAD",style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),
                        ),

                        SizedBox(height: 2,child: Container(color: Colors.black,),),

                        Column(
                          children: !_isLoading
                            ? balSpot1a1(balSpot)
                            : [const Center(child: CircularProgressIndicator())] 
                        ),


                      ]
                    ),
                  ),
                  const SizedBox(height: 80,)


                ]
              )
            ]
          )
        ),
      )
    );
  }
}



class ChartData {
  ChartData(this.x, this.y, [this.color]);
    final String x;
    final double y;
    final Color? color;
}



//Lista de balances SPOT
List<Widget> balSpot1a1(Map<String, double> balSpot) {
  
  List<Widget> resultado = [];

  balSpot.forEach((String symbol, double qnty) {
    resultado.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("$symbol",style: TextStyle(color: Colors.black,)),
          const Text("|"),
          Text("$qnty",style: TextStyle(color: Colors.black,))
        ],
      ),
    );
  });
  
  return resultado;
}