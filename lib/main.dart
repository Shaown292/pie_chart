import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const PieChart(),
    );
  }
}

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  final List<PieData> pies = [
    PieData(value: 0.2, color: Colors.purpleAccent),
    PieData(value: 0.2, color: Colors.cyan),
    PieData(value: 0.2, color: Colors.lightBlue),
    PieData(value: 0.2, color: Colors.deepPurple),
    PieData(value: 0.15, color: Colors.purple),
  ];
  List listTiles = ["A", "B", "C", "Footer"];
  String tapIndex = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Demo Pie Chart')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width:MediaQuery.of(context).size.width / 2,
                    child: ListView.builder(
                      itemCount: listTiles.length,
                      itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            color: Colors.red,
                            child: Center(
                              child: Text(listTiles[index]),
                            ),
                          );
                      },
                    ),
                  ),
                  CustomCard(
                    child:   EasyPieChart(
                      key: const Key('pie 6'),
                      children: pies,
                      pieType: PieType.fill,
                      onTap: (index) {},
                      start: 180,
                      animateFromEnd: true,
                      size: 130,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ));
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(padding: const EdgeInsets.all(20.0), child: child));
  }
}