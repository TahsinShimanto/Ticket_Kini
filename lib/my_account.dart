import 'package:flutter/material.dart';
import 'package:ticket_kini/my_ticket.dart';

import 'home_page.dart';

class MyAccount extends StatefulWidget {
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    int idx = 2;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        title: Text('My Account',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF00897B),letterSpacing: 1.2),),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          onTap: (index){
            if(index==0) Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
            if(index==1) Navigator.push(context, MaterialPageRoute(builder: (context)=> MyTicketsTab()));
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
