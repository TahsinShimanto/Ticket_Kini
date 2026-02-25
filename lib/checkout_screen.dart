import 'package:flutter/material.dart';
import 'PaymentTile.dart';
import 'sucess_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final int seatCount;
  final double totalAmount;

  const CheckoutScreen({
    super.key,
    required this.seatCount,
    required this.totalAmount,
  });

  @override
  State<CheckoutScreen> createState() =>
      _CheckoutScreenState();
}

class _CheckoutScreenState
    extends State<CheckoutScreen> {
  String selectedMethod = "bKash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Seats"),
                        Text("${widget.seatCount}")
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Amount"),
                        Text(
                            "৳${widget.totalAmount.toStringAsFixed(2)}")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            PaymentTile(
              title: "bKash",
              selected: selectedMethod == "bKash",
              onTap: () {
                setState(() {
                  selectedMethod = "bKash";
                });
              },
            ),
            PaymentTile(
              title: "Nagad",
              selected: selectedMethod == "Nagad",
              onTap: () {
                setState(() {
                  selectedMethod = "Nagad";
                });
              },
            ),
            PaymentTile(
              title: "Visa/Mastercard",
              selected: selectedMethod == "Card",
              onTap: () {
                setState(() {
                  selectedMethod = "Card";
                });
              },
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SuccessScreen(),
                    ),
                  );
                },
                child: Text(
                    "CONFIRM & PAY ৳${widget.totalAmount.toStringAsFixed(2)}"),
              ),
            )
          ],
        ),
      ),
    );
  }
}