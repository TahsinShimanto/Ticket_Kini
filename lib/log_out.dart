import 'package:flutter/material.dart';
import 'package:ticket_kini/auth_service.dart';
import 'package:ticket_kini/login_screen.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text('Log Out',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF00897B),),),
      ),

      body: SafeArea(
          child: Padding(
              padding:  EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.05),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                       Container(
                        width: screenWidth,
                        padding:  EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.025),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black12,blurRadius: 3)
                          ]

                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth*0.14,
                                height: screenHeight*0.06,
                                decoration: BoxDecoration(
                                    color: Color(0xFFE0F2F1),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(color: Colors.black45,blurRadius: 0.3)
                                  ]
                                ),
                                child: Icon(Icons.logout_rounded,color: Color(0xFF00897B),size: 30,),
                              ),
                              SizedBox(height: screenHeight*0.02,),
                              Text('Are you sure you want to', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                              Text('Log out?', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                              SizedBox(height: screenHeight*0.01,),
                              Text("You'll need to log in again to access your", style: TextStyle(fontSize: 14, color: Colors.grey),),
                              Text("account.", style: TextStyle(fontSize: 14, color: Colors.grey),),
                      
                            ],
                          ),
                        ),
                      ),



                  SizedBox(height: screenHeight*0.07,),
                  ElevatedButton(
                      onPressed: () async{
                        await _authService.logout();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              duration: Duration(seconds: 1),
                              content: Text("You're logged out",style: TextStyle(fontSize: 18,color: Color(0xFF00897B))),
                            )
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00897B),
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),
                      minimumSize: Size(screenWidth*0.8, screenHeight*0.055)
                    ),
                      child: Text('Log Out', style: TextStyle(fontSize: 22,color: Colors.white),),
                  ),
                  SizedBox(height: screenHeight*0.02,),

                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),
                      minimumSize: Size(screenWidth*0.8, screenHeight*0.055),
                      shadowColor: Color(0xFF00897B)
                    ),
                    child: Text('Cancel', style: TextStyle(fontSize: 22,color: Color(0xFF00897B)),),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
