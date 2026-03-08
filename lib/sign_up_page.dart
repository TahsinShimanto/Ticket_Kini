import 'package:flutter/material.dart';

import 'home_page.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF00897B),
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Color(0xFF00897B),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Center(
          child: Container(
              width: screenWidth*0.85,
              height: screenHeight*0.65,
              margin: EdgeInsets.only(bottom: screenHeight*0.1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black12,blurRadius: 20),
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_add_alt_1_rounded,color: Color(0xFF00897B),size: 70,),
                  SizedBox(height: screenHeight*0.03),

                  SizedBox(
                    width: screenWidth*0.7,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: 'Full Name'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.05),

                  SizedBox(
                    width: screenWidth*0.7,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Number'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.05),

                  SizedBox(
                    width: screenWidth*0.7,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.credit_card),
                          border: OutlineInputBorder(),
                          labelText: 'NID Number'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.05),

                  SizedBox(
                    width: screenWidth*0.7,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          border: OutlineInputBorder(),
                          labelText: 'Date of Birth'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.05),

                  SizedBox(
                    width: screenWidth*0.7,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          border: OutlineInputBorder(),
                          labelText: 'Set Password'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.08),

                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00897B),
                          minimumSize: Size(screenWidth*0.5, screenHeight*0.05),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      child: Text('Register',style: TextStyle(fontSize: 20,color: Colors.white),)
                  ),


                ],
              )
          )
      ),
    );
  }
}
