import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class SucessScreen extends StatefulWidget{
  const SucessScreen({super.key});
  State<SucessScreen>createState()=>
      _SucessScreenState();
}
class _SucessScreenState extends State<SucessScreen>{
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              "Payment Successful!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );




  }

}