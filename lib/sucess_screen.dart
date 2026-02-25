import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle,
                size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              "Payment Successful!",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}