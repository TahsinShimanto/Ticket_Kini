import 'package:flutter/material.dart';
import 'package:ticket_kini/login_screen.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log Out',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF00897B),),),
      ),

      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(screenWidth*0.03),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout,size: 110,),
                  SizedBox(height: screenHeight*0.05,),
                  Text('Are you sure you want to log out?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(height: screenHeight*0.01,),
                  Text('You will need to log in again to access your account.', style: TextStyle(fontSize: 14, color: Colors.grey),),
                  SizedBox(height: screenHeight*0.07,),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00897B),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                      minimumSize: Size(screenWidth*0.7, screenHeight*0.07)
                    ),
                      child: Text('Log Out', style: TextStyle(fontSize: 22,color: Colors.white),),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
