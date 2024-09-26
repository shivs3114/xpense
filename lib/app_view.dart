import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpense/data_model.dart';
import 'package:xpense/screens/home/view/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Transactions1(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        theme: ThemeData(colorScheme: ColorScheme.light(
          background:Colors.grey.shade100,
          onBackground: Colors.black,
          primary: Color(0xFF00B2E7),
          secondary: Color(0xFFE064F7),
          tertiary:Color(0xFFFF8D6C)
      
      
        ),
        ),
        home: HomeScreen(),
      
      ),
    );
  }
}