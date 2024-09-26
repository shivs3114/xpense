import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xpense/screens/home/view/mychart.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Container(width: double.infinity,
          height: 30,
            decoration: BoxDecoration(color: const Color.fromARGB(255, 193, 224, 249)),
            child: Center(child: Text('Transactions',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))),
          SizedBox(height: 20,),
          SizedBox(height: MediaQuery.of(context).size.width-30,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyChart(),
          ),)
        ],
      ),
    );
  }
}