import 'package:flutter/material.dart';
import 'package:ticket_kini/change_password.dart';
import 'package:ticket_kini/log_out.dart';
import 'package:ticket_kini/login_screen.dart';
import 'package:ticket_kini/my_ticket.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';

class MyAccount extends StatefulWidget {
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  int idx = 2;
  String userName = "";
  String userPhone = "";
  String userNID = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }

  void loadUserData () async
  {
    User? user = FirebaseAuth.instance.currentUser;

   if(user!=null)
     {
       DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

       setState(() {
         userName = doc['name'];
         userPhone = doc['phone'];
         userNID = doc['nid'];
       });
     }
   //bypass
   else
     {
       setState(() {
         userName = 'Test user';
         userPhone = '0000';
         userNID = '0000';
       });
     }

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        automaticallyImplyLeading: false,
        title: Text('Account',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF00897B),letterSpacing: 1.2),),
      ),

      body: SafeArea(child: Padding(
          padding: EdgeInsets.all(screenWidth*0.05),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight*0.02,),
                Center(
                  child: Icon(Icons.account_circle,size: 110,),
                ),
                SizedBox(height: screenHeight*0.03,),
                Text('User Details',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(
                  width: screenWidth,
                  child: Card(
                    color: Colors.white70,
                    child: Padding(
                        padding: EdgeInsets.all(screenWidth*0.03),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth*0.85,
                              height: screenHeight*0.06,
                              padding: EdgeInsets.only(left: screenWidth*0.02),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadiusGeometry.circular(10)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Name: $userName',style: TextStyle(fontSize: 18,color: Colors.black54),),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight*0.01,),
            
                            Container(
                              width: screenWidth*0.85,
                              height: screenHeight*0.06,
                              padding: EdgeInsets.only(left: screenWidth*0.02),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadiusGeometry.circular(10)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Phone Number: $userPhone',style: TextStyle(fontSize: 18,color: Colors.black54),),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight*0.01,),
            
                            Container(
                              width: screenWidth*0.85,
                              height: screenHeight*0.06,
                              padding: EdgeInsets.only(left: screenWidth*0.02),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadiusGeometry.circular(10)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('NID Number: $userNID',style: TextStyle(fontSize: 18,color: Colors.black54),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.03),
                Text('Manage Account',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(
                  width: screenWidth,
                  child: Card(
                    child: Padding(
                      padding:  EdgeInsets.all(screenWidth*0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                            },
                            child: Center(
                              child: Container(
                                width: screenWidth*0.85,
                                height: screenHeight*0.06,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadiusGeometry.circular(10)
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.all(screenWidth*0.03),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Change Password',style: TextStyle(fontSize: 18,color: Colors.black),),
                                          Icon(Icons.arrow_forward_ios,size: 20,)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight*0.01,),
            
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOut()));
                            },
                            child: Center(
                              child: Container(
                                width: screenWidth*0.85,
                                height: screenHeight*0.06,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadiusGeometry.circular(10)
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.all(screenWidth*0.03),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Log Out',style: TextStyle(fontSize: 18,color: Colors.red),),
                                          Icon(Icons.arrow_forward_ios,size: 20,)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          )
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
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account')
          ]),
    );
  }
}
