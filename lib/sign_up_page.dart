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
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Center(
          child: Container(
              width: screenWidth*0.75,
              height: screenHeight*0.6,
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
                  //const Text('Create Account',style: TextStyle(fontSize: 30),),
                  Icon(Icons.person_add_alt_1_rounded,color: Color(0xFF00897B),size: 70,),
                  SizedBox(height: screenHeight*0.04),

                  SizedBox(
                    width: screenWidth*0.65,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full Name'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.05),

                  SizedBox(
                    width: screenWidth*0.65,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Number'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.05),

                  SizedBox(
                    width: screenWidth*0.65,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.05),

                  SizedBox(
                    width: screenWidth*0.65,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'NID Number'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.1),

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
                      child: Text('Register',style: TextStyle(fontSize: 20,color: Colors.black),)
                  ),


                ],
              )
          )
      ),
    );
  }
}
