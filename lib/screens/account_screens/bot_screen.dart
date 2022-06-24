import 'package:elitebotrading/api/apiget_operations.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../api/apiget_rent_bot.dart';







class BotScreen extends StatefulWidget {
  const BotScreen({Key? key}) : super(key: key);

  @override
  State<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> with TickerProviderStateMixin{
   late TabController _tabController;
   @override
   void initState() {
     super.initState();
     _tabController = TabController(length: 2, vsync: this);
   }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          /* 
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue
            ),*/
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: const Text(
            "Bot",style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          
          bottom:  TabBar(
            indicatorColor: const Color.fromARGB( 255, 199, 0, 57),
            controller: _tabController,
            indicatorWeight: 5,
            isScrollable: true,
            tabs: const [
              Text("P&L Diario"),
              Text("Operaciones"),
            ],
          )
        ),
    
    
        body: TabBarView(
          controller: _tabController,
          children: [
            PyLDiario(),
            Operaciones(),
          ],
        )
      ),
    );
  }
}





class PyLDiario extends StatefulWidget {


  @override
  State<PyLDiario> createState() => _PyLDiarioState();
}

class _PyLDiarioState extends State<PyLDiario> {

  bool _isLoading = false;
  List<EarningsTimeline> listEarningssemana = [];
  List<EarningsTimeline> listEarningsmes = [];
  List<EarningsTimeline> listEarningstresmes = [];
  late Map datos;


  @override
  initState()  {
    super.initState();
    inicio();

  }

  Future inicio() async {
    _isLoading = true;
    setState(() {});
    datos= await getrentbotdatos();
    List datossemana = datos['semana'];
    List datosmes = datos['mes'];
    List datostresmes = datos['trmes'];
    for(var i = 0; i < datossemana.length; i++) {
      listEarningssemana.add(EarningsTimeline(date:datossemana[i][0], profit: datossemana[i][1]),);
    }
    for(var i = 0; i < datosmes.length; i++) {
      listEarningsmes.add(EarningsTimeline(date:datosmes[i][0], profit: datosmes[i][1]),);
    }
    for(var i = 0; i < datostresmes.length; i++) {
      listEarningstresmes.add(EarningsTimeline(date:datostresmes[i][0], profit: datostresmes[i][1]),);
    }


    _isLoading = false;
    setState(() {});
  }


  

  @override
  Widget build(BuildContext context) {
    List<charts.Series<EarningsTimeline, String>> timelinesemana = [
      charts.Series(
      id: 'Subscribers',
      data: listEarningssemana,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      domainFn: (EarningsTimeline timeline, _) => timeline.date,
      measureFn: (EarningsTimeline timeline, _) => timeline.profit,  
      )
    ];

    List<charts.Series<EarningsTimeline, String>> timelinemes = [
      charts.Series(
      id: 'Subscribers',
      data: listEarningsmes,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.orange),
      domainFn: (EarningsTimeline timeline, _) => timeline.date,
      measureFn: (EarningsTimeline timeline, _) => timeline.profit,  
      )
    ];

    List<charts.Series<EarningsTimeline, String>> timelinetresmes = [
      charts.Series(
      id: 'Subscribers',
      data: listEarningstresmes,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.yellow.shade700),
      domainFn: (EarningsTimeline timeline, _) => timeline.date,
      measureFn: (EarningsTimeline timeline, _) => timeline.profit,  
      )
    ];

    return Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background-onlylogo.png'), opacity: 0.4),
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 47, 47, 47),Color.fromARGB(255, 19, 19, 19)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                //START Container Gráfico ########
                const SizedBox(height: 20,),
                const Text(
                  'SEMANA',
                  style: TextStyle(fontSize: 25,color: Colors.white,),
                ),
                SizedBox(
                  height: 400.0,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.only(right: 10,left: 10,top: 20,bottom: 30),
                        padding: const EdgeInsets.all(15),
                        height: 400.0,
                        width: 320,
                        child: !_isLoading
                          ? charts.BarChart(timelinesemana, animate: true)
                          : const Center(child: CircularProgressIndicator())
                      )
                    ],
                  ),
                ),
                //END Container Gráfico #####


                //START Container Gráfico ########
                const SizedBox(height: 20,),
                const Text(
                  'MES',
                  style: const TextStyle(fontSize: 25,color: Colors.white,),
                ),
                SizedBox(
                  height: 400.0,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.only(right: 10,left: 10,top: 20,bottom: 30),
                        padding: const EdgeInsets.all(15),
                        height: 400.0,
                        width: 934,
                        child: !_isLoading
                          ? charts.BarChart(timelinemes, animate: true)
                          : const Center(child: CircularProgressIndicator())
                      )
                    ],
                  ),
                ),
                //END Container Gráfico #####


                //START Container Gráfico ########
                const SizedBox(height: 20,),
                const Text(
                  '3 MESES',
                  style: TextStyle(fontSize: 25,color: Colors.white,),
                ),
                SizedBox(
                  height: 400.0,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.only(right: 10,left: 10,top: 20,bottom: 30),
                        padding: const EdgeInsets.all(15),
                        height: 400.0,
                        width: 2800,
                        child: !_isLoading
                          ? charts.BarChart(timelinetresmes, animate: true)
                          : const Center(child: CircularProgressIndicator())
                        
                      )
                    ],
                  ),
                ),
                //END Container Gráfico #####
              ],
            ),
          )
        ),
      );
  }
}
 
class Operaciones extends StatefulWidget {

  @override
  State<Operaciones> createState() => _OperacionesState();
}

class _OperacionesState extends State<Operaciones> {
  bool _isLoading = false;

  late List<Widget> operations;

  @override
  initState() {
    super.initState();
    _isLoading = true;  
    setState(() {});
    inicio();
    
  }
  inicio() async {
    operations = await apiGetOperations();
    _isLoading = false;  
    setState(() {});
  }

  

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/background-onlylogo.png'), opacity: 0.4),
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 47, 47, 47),Color.fromARGB(255, 19, 19, 19)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
                ),
          ),
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration:  const BoxDecoration( 
              color: Color.fromARGB(255, 5, 5, 5) ,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
            ),
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("SIDE"),
                      Text("P.Open"),
                      Text("P.Close"),
                      Text("PROFIT"),
                    ],
                  ),
                ),


                SizedBox(height: 2,child: Container(color: Colors.white,),),
                Container(
                  height: MediaQuery.of(context).size.height - 260,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    children: !_isLoading
                      ? operations
                      : [const Center(child: CircularProgressIndicator())]
                  ),
                ),
                SizedBox(height: 2,child: Container(color: Colors.white,),)

                  
              ]
            )
          ),
        ),
      );
  }
}
 
class TresMesesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/background-onlylogo.png'), opacity: 0.4),
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 47, 47, 47),Color.fromARGB(255, 19, 19, 19)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
              ),
        ),
      ),
    );
  }
}



class EarningsTimeline {
  final String date;
  final double profit;

  EarningsTimeline({
    required this.date,
    required this.profit,
  }); 
}