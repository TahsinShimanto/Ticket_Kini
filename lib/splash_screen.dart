import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4),(){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00897B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_bus,size: 100,color: Colors.white),
            SizedBox(height: 24,),
            Text('Ticket Kini',style: TextStyle(fontSize: 20,color: Colors.white,fontStyle: FontStyle.italic),)
          ],
        ),
      ),
    );
  }
}
