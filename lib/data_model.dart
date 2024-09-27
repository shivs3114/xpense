import 'package:flutter/material.dart';




  class Transactions1 extends ChangeNotifier{

    List<Transactions> _items=[  Transactions(amount: '1000', name:'Grocery',desc: 'Few items remaining',icon:Icons.local_grocery_store),
  Transactions(amount:'1660', name:'Snacks',icon: Icons.food_bank_sharp),
  Transactions(amount: '2000', name:'Medicines',icon: Icons.local_pharmacy),
  Transactions(amount: '500', name:'Electricity Bill',icon: Icons.electrical_services),
  Transactions(amount:'1090', name:'Gas Cylinder',icon: Icons.gas_meter_outlined),
  Transactions(amount: '2000', name:'Sweets',icon: Icons.local_pharmacy),
  Transactions(amount: '500', name:'MIXER Machine',icon: Icons.electrical_services),
  Transactions(amount:'1060', name:'Stationary',icon: Icons.gas_meter_outlined)
  
  ];
  get Items=>_items;
    
  void addItem(Transactions t) {
    _items.add(t);
    notifyListeners();
    print(_items.last.amount);
    
  }
  }


  
class Transactions{
  final String amount;
  final String name;
  final IconData icon;
   String? date;
  String? desc;
  Transactions( {required this.amount,required this.name,this.desc,required this.icon,this.date,});


}

