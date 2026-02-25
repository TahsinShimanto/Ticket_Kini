import 'package:flutter/material.dart';
import 'checkout_screen.dart';
import 'results_screen.dart';

class SeatSelectionScreen extends StatefulWidget {
  final Transport transport;
  final String from;
  final String to;

  const SeatSelectionScreen({
    super.key,
    required this.transport,
    required this.from,
    required this.to,
  });

  @override
  State<SeatSelectionScreen> createState() =>
      _SeatSelectionScreenState();
}

class _SeatSelectionScreenState
    extends State<SeatSelectionScreen> {

  List<bool> selectedSeats =
  List.generate(28, (index) => false);

  int get selectedCount =>
      selectedSeats.where((seat) => seat).length;

  double get totalAmount =>
      selectedCount * widget.transport.fare;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Seats - ${widget.transport.name}"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [

          const SizedBox(height: 10),

          // Route info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.from, style: const TextStyle(fontWeight: FontWeight.bold)),
                const Icon(Icons.arrow_forward, size: 16),
                Text(widget.to, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                Text("৳${widget.transport.fare.toStringAsFixed(0)}/seat",
                    style: const TextStyle(color: Colors.teal)),
              ],
            ),
          ),

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
                      style: const TextStyle(fontSize: 16),
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
                                seatCount: selectedCount,
                                totalAmount: totalAmount,
                              ),
                        ),
                      );
                    },
                    child: const Text("Confirm Booking"),
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
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}