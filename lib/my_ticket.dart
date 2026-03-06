import 'package:flutter/material.dart';
import 'package:ticket_kini/home_page.dart';

import 'my_account.dart';

class MyTicketsTab extends StatefulWidget {
  const MyTicketsTab({super.key});

  @override
  State<MyTicketsTab> createState() => _MyTicketsTabState();
}

class _MyTicketsTabState extends State<MyTicketsTab> {
  int idx = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Tickets',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF00897B),letterSpacing: 1.2),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
          onTap: (index){
          if(index==0) Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          if(index==2) Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAccount()));
          setState(() {
            idx = index;
          });
          },
          selectedItemColor: Color(0xFF00897B),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.confirmation_num_outlined),label: 'My Ticket'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'My Account')
          ]),
    );
  }
}
