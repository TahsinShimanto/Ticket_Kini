import 'package:flutter/material.dart';
import 'checkout_screen.dart';
import 'home_page.dart';

class SucessScreen extends StatefulWidget{
  const SucessScreen({super.key});
  State<SucessScreen>createState()=>
      _SucessScreenState();
}
class _SucessScreenState extends State<SucessScreen>{

  //=============================S=====================================================================
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
        );
      }
    });
  }
  //===============================================================================================



  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),
        ),
        backgroundColor: Colors.teal,
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