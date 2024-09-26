import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:xpense/data_model.dart';
import 'package:xpense/screens/home/view/main_screen.dart';
import 'package:xpense/screens/home/view/stats.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;
TextEditingController c1=TextEditingController();
Transactions1 t=Transactions1();
String? amount;
String? description;
TextEditingController c2=TextEditingController();
  void Ontap(value)
  {setState(() {
    index=value;
  });}

  List<Widget> _widgetOptions = <Widget>[
  MainScreen(),

StatsScreen()
  
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body:_widgetOptions.elementAt(index),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          onTap:Ontap,
          currentIndex: index,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: true,
          selectedItemColor:Colors.red,
          elevation: 3,
          items:[
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.home),label: 'Home',),
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.graph_square_fill,),label: 'Stats'),
        
          
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(shape:
      const CircleBorder() ,
      
      child: Container(width:60,height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        gradient: LinearGradient(transform: GradientRotation(180/4),
        colors:[Theme.of(context).colorScheme.primary,Theme.of(context).colorScheme.secondary,Theme.of(context).colorScheme.tertiary])
      ),child: Icon(CupertinoIcons.add)),onPressed:(){
    showDialog(context: context, builder:(BuildContext context){
    return SimpleDialog(
      surfaceTintColor: const Color.fromARGB(255, 50, 1, 17),
      title:Text('Enter details',style: TextStyle(fontWeight: FontWeight.bold),),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: c1,
            onChanged: (value){amount=value;},
            decoration: InputDecoration(
              label:Text('Enter amount'),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value){description=value;},
            decoration: InputDecoration(focusedBorder: OutlineInputBorder(),
              label:Text('Enter Details'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()
              {if(amount!=null && description!=null){print('!!!!');
  
                  Provider.of<Transactions1>(context,listen: false).addItem(Transactions(amount:amount!, name: description!, icon:Icons.local_grocery_store));
                
              c1.clear();c2.clear();
              Navigator.pop(context);}},
               child:Text('Save',style: TextStyle(color: Colors.white),),
               style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
              Spacer(),


              
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child:Text('Cancel',style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor:Colors.red),)
            ],
          ),
        ),
      ],
    );
      });}),
    );
  }
}