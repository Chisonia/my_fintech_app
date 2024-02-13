import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_fintech_app/views/account_view.dart';
import 'package:my_fintech_app/views/home_view.dart';
import 'package:my_fintech_app/views/invest_view.dart';
import 'package:my_fintech_app/views/savings_view.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listOfPages = [
    HomeView(),
    SavingsView(),
    InvestView(),
    AccountView()
  ];
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text("Savings App")
      ),
      body: listOfPages[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (kDebugMode) {
            print("FAB CLICKED");
          }
        },
        focusColor: Colors.blue,
        hoverColor: Colors.blue.shade900,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value){
          setState((){
            selectedIndex = value;
    });
    },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.savings), label: "Savings"),
          BottomNavigationBarItem(icon: Icon(Icons.rocket_launch), label: "Invest"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account")
        ],
      ),
    );
  }
}