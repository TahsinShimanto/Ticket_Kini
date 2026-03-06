import 'package:flutter/material.dart';

class NewSeatSelectionScreen extends StatelessWidget {
  const NewSeatSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seat Selection")),
      body: Center(
        child: Text("Seat Selection Screen"),
      ),
    );
  }
}