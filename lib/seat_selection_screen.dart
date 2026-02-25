import 'package:flutter/material.dart';
import 'checkout_screen.dart';
class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() =>
      _SeatSelectionScreenState();
}

class _SeatSelectionScreenState
    extends State<SeatSelectionScreen> {

  List<bool> selectedSeats =
  List.generate(28, (index) => false);

  final double seatPrice = 750;

  int get selectedCount =>
      selectedSeats.where((seat) => seat).length;

  double get totalAmount =>
      selectedCount * seatPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Seats - X"),
      ),
      body: Column(
        children: [

          const SizedBox(height: 10),

          /// Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendBox(Colors.grey.shade300),
              const SizedBox(width: 8),
              const Text("Available"),
              const SizedBox(width: 20),
              _legendBox(Color(0xFF00897B)),
              const SizedBox(width: 8),
              const Text("Selected"),
            ],
          ),

          const SizedBox(height: 15),

          /// Seats Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: selectedSeats.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSeats[index] =
                      !selectedSeats[index];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedSeats[index]
                          ? Color(0xFF00897B)
                          : Colors.grey.shade300,
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.event_seat,
                      color: Colors.black54,
                    ),
                  ),
                );
              },
            ),
          ),

          /// Bottom Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black12,
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Selected Seats: $selectedCount",
                      style: const TextStyle(
                          fontSize: 16),
                    ),
                    Text(
                      "Total: ৳${totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedCount == 0
                        ? null
                        : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CheckoutScreen(
                                seatCount:
                                selectedCount,
                                totalAmount:
                                totalAmount,
                              ),
                        ),
                      );
                    },
                    child:
                    const Text("Confirm Booking"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendBox(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
        BorderRadius.circular(4),
      ),
    );
  }
}