import 'package:flutter/material.dart';
//import 'seat_selection_screen.dart';

class Transport {
  final String name;
  final String time;
  final double fare;
  final int availableSeats;
  final String type; // 'Bus' or 'Train'

  Transport({
    required this.name,
    required this.time,
    required this.fare,
    required this.availableSeats,
    required this.type,
  });
}


class ResultsScreen extends StatelessWidget {
  final String type;
  final String from;
  final String to;
  ResultsScreen({required this.type, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    List<Transport> results = [
      Transport(name: "$type Express A", time: "08:00 AM", fare: 500, availableSeats: 12, type: type),
      Transport(name: "$type Service B", time: "12:00 PM", fare: 750, availableSeats: 5, type: type),
      Transport(name: "$type Night Coach", time: "10:00 PM", fare: 600, availableSeats: 20, type: type),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Available $type")),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final item = results[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(item.name),
              subtitle: Text("Time: ${item.time} | Available: ${item.availableSeats}"),
              trailing: Text("\৳${item.fare}"),
              // onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SeatSelectionScreen(
              //           transport: item,
              //           from: from,
              //           to: to,
              //         )
              //     )
              // ),
            ),
          );
        },
      ),
    );
  }
}