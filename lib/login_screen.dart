import 'package:flutter/material.dart';
import 'home_page.dart';
import 'sign_up_page.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF00897B),
      body: Center(
          child: Container(
              width: screenWidth*0.75,
              height: screenHeight*0.55,
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
                  //const Text('Login',style: TextStyle(fontSize: 30),),
                  Icon(Icons.account_circle_rounded,size: 70,color: Color(0xFF00897B),),
                  SizedBox(height: screenHeight*0.05),

                  SizedBox(
                    width: screenWidth*0.65,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Number'
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.06),

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
                      child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.black),)
                  ),
                  SizedBox(height: screenWidth*0.1),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account? "),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                        child: Text('Sign Up',style: TextStyle(color: Color(0xFF00897B),fontWeight: FontWeight.bold),),

                      )
                    ],
                  )
                ],
              )
          )
      ),
    );
  }
}
