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
         userName = 'Nowfel Bhalo Hoye Jao';
         userPhone = '0167676767';
         userNID = '67676767';
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

      body: SafeArea(
          child: Padding(
          padding: EdgeInsets.all(screenWidth*0.05),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight*0.02,),
                Center(
                  child: Container(
                    width: screenWidth*0.27,
                    height: screenHeight*0.12,
                    decoration: BoxDecoration(
                      color: Color(0xFFE0F2F1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black54,blurRadius: 0.3)
                      ]
                    ),
                    child: Icon(Icons.person,size: 90,color: Color(0xFF00897B),),
                  ),
                ),
                SizedBox(height: screenHeight*0.03,),
                Text('User Details',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Card(
                  child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(vertical: screenHeight*0.015),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.05,),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth*0.12,
                                height: screenHeight*0.055,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0F2F1),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black45,blurRadius: 0.5)
                                  ]
                                ),
                                child: Icon(Icons.person,color: Color(0xFF00897B),),
                              ),
                              SizedBox(width: screenWidth*0.05,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('User name',style: TextStyle(fontSize: 16,color: Colors.grey),),
                                  Text(userName,style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black12,),

                        Padding(
                          padding:  EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.05),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth*0.12,
                                height: screenHeight*0.055,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0F2F1),
                                  borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black45,blurRadius: 0.5)
                                    ]
                                ),
                                child: Icon(Icons.phone,color: Color(0xFF00897B),),
                              ),
                              SizedBox(width: screenWidth*0.05,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Phone Number',style: TextStyle(fontSize: 16,color: Colors.grey),),
                                  Text(userPhone,style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black12,),

                        Padding(
                          padding:  EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.05),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth*0.12,
                                height: screenHeight*0.055,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0F2F1),
                                  borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black45,blurRadius: 0.5)
                                    ]
                                ),
                                child: Icon(Icons.credit_card,color: Color(0xFF00897B),),
                              ),
                              SizedBox(width: screenWidth*0.05,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('NID',style: TextStyle(fontSize: 16,color: Colors.grey),),
                                  Text(userNID,style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight*0.03),
                Text('Manage Account',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(
                  width: screenWidth,
                  child: Card(
                    child: Padding(
                      padding:  EdgeInsetsGeometry.symmetric(vertical: screenHeight*0.015),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                            },
                            child: Center(
                              child: Container(
                                width: screenWidth*0.85,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadiusGeometry.circular(10),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12,blurRadius: 2)
                                    ]
                                ),
                                   child: Padding(
                                      padding:  EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.01),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: screenWidth*0.12,
                                            height: screenHeight*0.055,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFE0F2F1),
                                                borderRadius: BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(color: Colors.black45,blurRadius: 0.5)
                                                ]
                                            ),
                                            child: Icon(Icons.lock_outline,color: Color(0xFF00897B),),
                                          ),
                                          SizedBox(width: screenWidth*0.05,),

                                          Text('Change Password',style: TextStyle(fontSize: 18,color: Colors.black),),
                                          Spacer(),
                                          Icon(Icons.arrow_forward_ios,size: 20,)
                                        ],
                                      ),
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
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadiusGeometry.circular(10),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12,blurRadius: 2)
                                    ]
                                ),

                                    child: Padding(
                                      padding:  EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.01),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: screenWidth*0.12,
                                            height: screenHeight*0.055,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFE0F2F1),
                                                borderRadius: BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(color: Colors.black45,blurRadius: 0.5)
                                                ]
                                            ),
                                            child: Icon(Icons.logout,color: Color(0xFF00897B),),
                                          ),
                                          SizedBox(width: screenWidth*0.05,),
                                          Text('Log Out',style: TextStyle(fontSize: 18,color: Colors.red),),
                                          Spacer(),
                                          Icon(Icons.arrow_forward_ios,size: 20,)
                                        ],
                                      ),
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
