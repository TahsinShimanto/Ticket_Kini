import 'package:flutter/material.dart';

import 'bus.dart';
import 'my_account.dart';
import 'my_ticket.dart';
import 'train.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(height: screenHeight*0.05,),
              SizedBox(width: screenWidth*0.03,),
              Text('Hi there!',style: TextStyle(color: Colors.black45,fontSize: 16),),
            ],
          ),
          SizedBox(height: screenHeight*0.001),
          Row(
            children: [
              SizedBox(width: screenWidth*0.03,),
              Text("How would you like to travel?",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: screenHeight*0.05),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Bus()));
            },
            child: Center(
              child: Container(
                width: screenWidth*0.9,
                height: screenHeight*0.2,
                decoration: BoxDecoration(
                  color: Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.directions_bus,size: screenWidth*0.2,color: Color(0xFFE65100),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Bus', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black,),),
                        SizedBox(height: screenHeight * 0.005),
                        Text('Search Bus Tickets', style: TextStyle(fontSize: 14,color: Colors.black45,),),
                      ],
                    ),

                    Icon(Icons.arrow_right,size: screenWidth*0.1,color: Colors.black,)
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight*0.05),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Train()));
            },
            child: Center(
              child: Container(
                width: screenWidth*0.9,
                height: screenHeight*0.2,
                decoration: BoxDecoration(
                  color: Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.directions_train,size: screenWidth*0.2,color: Color(0xFF1565C0),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Train', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black,),),
                        SizedBox(height: screenHeight * 0.005),
                        Text('Search Train Tickets', style: TextStyle(fontSize: 14,color: Colors.black45,),),
                      ],
                    ),

                    Icon(Icons.arrow_right,size: screenWidth*0.1,color: Colors.black,)
                  ],
                ),
              ),
            ),
          ),

        ],
      )

      ),


      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selIndex,
          onTap: (index){
            if(index==1) Navigator.push(context, MaterialPageRoute(builder: (context)=> MyTicket()));
            if(index==2) Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAccount()));
            setState(() {
              _selIndex = index;
            });
          },
          selectedItemColor: Color(0xFF00897B),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.confirmation_num_outlined),label: 'My Ticket'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'My Account')
          ]
      ),
    );
  }
}
