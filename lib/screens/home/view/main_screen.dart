import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xpense/app_view.dart';
import 'package:xpense/data_model.dart';
class MainScreen extends StatefulWidget {
  
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Transactions1 t=Transactions1();

  @override
  Widget build(BuildContext context) {
    return Consumer<Transactions1>(
      builder: (context, transactions, child) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
          child: Column(
            children: [
              Row(children: [Stack(
                alignment: Alignment.center,
                children: [Container(width: 50,height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow[600]
                ),),
                Icon(CupertinoIcons.person_fill,color: Colors.yellow[900],)
              ]),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text("Welcome",style:TextStyle(fontSize: 12,fontWeight:FontWeight.w600),),
                  Text('User',style:TextStyle(fontSize: 18,fontWeight:FontWeight.w600),)
                ],
              ),
              Spacer(),
              IconButton(icon:Icon(CupertinoIcons.settings),onPressed: (){},
              )]),
              SizedBox(height: 20,),
              Container(
                
                height: MediaQuery.of(context).size.width/2,
                width:  MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 4,color: Colors.grey.shade300,offset: Offset(5,5),
               )],
                  gradient: LinearGradient(transform: GradientRotation(180/4),
          colors:[
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.tertiary,
          Theme.of(context).colorScheme.primary,]),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total Balance',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text('₹ 100,000.00',style: TextStyle(fontSize: 36,color: Colors.white,fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(
                          children: [
                            Container(width: 20,height: 20,child: Center(child: Icon(CupertinoIcons.arrow_down,size: 12,color: Colors.green,),),
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),),
                            SizedBox(width: 5,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ Text('Income',style: TextStyle(fontSize: 14,color: Colors.white,)),
                      Text('₹ 22,000.00',style: TextStyle(fontSize: 14,color: Colors.white,)),],),
          
                          ],
                        ),
                        Row(children: [Container(width: 20,height: 20,child: Center(child: Icon(CupertinoIcons.arrow_down,size: 12,color: Colors.red,),),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),),
                        SizedBox(width: 5,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ Text('Expenses',style: TextStyle(fontSize: 14,color: Colors.white,)),
                      Text('₹ 16,000.00',style: TextStyle(fontSize: 14,color: Colors.white,)),],)
                      ],)
                        
                      
                      ],),
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Transactions',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.onBackground))
             ,GestureDetector(onTap: (){},
              child: Text('View All',style: TextStyle(decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,fontSize: 16,color:const Color.fromARGB(255, 47, 249, 54)))
              )],)
              ,
              Expanded(
                child: ListView.builder(
                  
                  itemCount: t.items.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:const Color.fromARGB(255, 238, 198, 181),
                        boxShadow: [BoxShadow(color:Colors.yellow,spreadRadius: 3)],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Row(
                            
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(alignment:Alignment.center,
                                  children:[ Container(decoration: BoxDecoration(color: Colors.yellow,shape: BoxShape.circle),width: 30,height: 30,),Icon( t.items[index].icon)]),
                              ),
                              SizedBox(width: 10,),
                          Text(t.items[index].name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900),),
                            ],
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                              Text('-₹'+'${t.items[index].amount}',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Today')
                            ],),
                          )
                        
                        ]
                          ),
                        ),
                  )
                    ),
                  ),
                ]),
              
            
          
            )
        );
      });
  }
}