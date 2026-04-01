import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'my_account.dart';
import 'my_ticket.dart';
import 'auth_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int idx = 0;
  String userName = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserName();
  }

  void loadUserName() async{
    User? user = FirebaseAuth.instance.currentUser;

    if(user!=null)
      {
        DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        setState(() {
          userName = doc['name'];
        });
      }
    //else{ userName = "User";}
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor:Color(0xFFFAFAFA),
        automaticallyImplyLeading: false,
        title: Text('Home',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF00897B),letterSpacing: 1.3),),

      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.025),

            Row(
              children: [
                SizedBox(width: screenWidth*0.05,),
                Text('Hi there $userName!',style: TextStyle(color: Colors.black45,fontSize: 14),),
              ],
            ),
            SizedBox(height: screenHeight*0.005),

            Row(
              children: [
                SizedBox(width: screenWidth*0.05,),
                Text("How would you like to travel?",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: screenHeight*0.03),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    SearchScreen(transportType: 'Bus')));
              },
              child: Center(
                child: Container(
                  width: screenWidth*0.9,
                  height: screenHeight*0.15,
                  decoration: BoxDecoration(
                    color: Color(0xFFE0F2F1),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.black26,blurRadius: 1,offset: Offset(1,1.5))
                    ]
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.directions_bus,size: 70,color: Color(0xFFE65100),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bus', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black,),),
                          SizedBox(height: screenHeight * 0.008),
                          Text('Search Bus Tickets', style: TextStyle(fontSize: 14,color: Colors.black45,),),
                        ],
                      ),
        
                      Icon(Icons.arrow_forward_ios,size: 18,color: Colors.black45,)
                    ],
                  ),
                ),
              ),
            ),
        
            SizedBox(height: screenHeight*0.03),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    SearchScreen(transportType: 'Train')));
              },
              child: Center(
                child: Container(
                  width: screenWidth*0.9,
                  height: screenHeight*0.15,
                  decoration: BoxDecoration(
                    color: Color(0xFFE0F2F1),
                    borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.black26,blurRadius: 1,offset: Offset(1, 1.5))
                      ]
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.directions_train,size: 70,color: Color(0xFF1565C0),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Train', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black,),),
                          SizedBox(height: screenHeight * 0.008),
                          Text('Search Train Tickets', style: TextStyle(fontSize: 14,color: Colors.black45,),),
                        ],
                      ),

                      Icon(Icons.arrow_forward_ios,size: 18,color: Colors.black45,)
                    ],
                  ),
                ),
              ),
            ),
        
          ],
        ),
      )

      ),


      bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          onTap: (index){
            if(index==1) Navigator.push(context, MaterialPageRoute(builder: (context)=> MyTicketsTab()));
            if(index==2) Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAccount()));
            setState(() {
              idx = index;
            });
          },
          selectedItemColor: Color(0xFF00897B),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.confirmation_num_outlined),label: 'My Ticket'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account')
          ]
      ),
    );
  }
}
