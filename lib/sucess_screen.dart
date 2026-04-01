import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'checkout_screen.dart';
import 'home_page.dart';

class SucessScreen extends StatefulWidget{
  final Map<String, dynamic> ticketData;
  const SucessScreen({super.key, required this.ticketData});
  State<SucessScreen>createState()=>
      _SucessScreenState();
}
class _SucessScreenState extends State<SucessScreen>{

  //=============================S=====================================================================
  void initState() {
    super.initState();
        _save();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
        );
      }
    });
  }

  Future<void> _save() async {
    DocumentReference ref = await FirebaseFirestore.instance
        .collection('tickets')
        .add(widget.ticketData);

    await ref.update({'ticketId': ref.id});
  }
  //===============================================================================================



  Widget build(BuildContext){
    return Scaffold(
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