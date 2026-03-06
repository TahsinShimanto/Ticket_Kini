import 'package:flutter/material.dart';

import 'seat_selection_screen.dart';
import 'newseat_selection_screen.dart';
class TransportListScreen extends StatelessWidget {


  final List transportlist = [
    {"name": "Suborna Express", "time": "07:00 AM"},
    {"name": "Mohanagar Prabhati", "time": "07:20 AM" },
    {"name": "Sonar Bangla Express", "time": "04:45 PM"},
    {"name": "Mohanagar Godhuli", "time": "03:00 PM"},
    {"name": "Turna Express", "time": "11:00 PM"},
    {"name": "Cox's Bazar Express", "time": "03:40 PM"},
  ];




  final List coachlist = [
    {"name": "SNIGDHA", "fare": 850, "availableSeats": 20},
    {"name": "AC_S", "fare": 800, "availableSeats": 24},
    {"name": "AC_B", "fare": 1200, "availableSeats": 12},
    {"name": "S_CHAIR", "fare": 500, "availableSeats": 40},
    {"name": "SHOVON", "fare": 350, "availableSeats": 60},
    {"name": "SHULOV", "fare": 250, "availableSeats": 70},
    {"name": "F_SEAT", "fare": 700, "availableSeats": 24},
    {"name": "F_BERTH", "fare": 1000, "availableSeats": 12},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transport List",
          style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: transportlist.length,
          itemBuilder: (context, index) {
            final item = transportlist[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["name"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00897B),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dhaka",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00897B),
                            ),
                          ),
                          Icon(Icons.arrow_forward, color: Color(0xFF00897B)),
                          Text(
                            "Chittagong",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00897B),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        item["time"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 6),

                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: coachlist.length,
                        itemBuilder: (context, index) {
                          final coach = coachlist[index];
                          return Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),


                            alignment: Alignment.topLeft,

                            margin: const EdgeInsets.all(8),
                            width: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coach["name"],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00897B),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "৳"+coach["fare"].toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00897B),
                                  ),
                                ),
                                Text(
                                  "Available Tickets",
                                  style: TextStyle(
                                    fontSize: 11,

                                  ),
                                ),
                                SizedBox(height: 9),
                                Text(
                                  coach["availableSeats"].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00897B),

                                  ),
                                ),
                                SizedBox(height: 6),

                                SizedBox(
                                  width: 150,
                                  height: 25,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                       context,
                                        MaterialPageRoute(
                                          builder: (context) => NewSeatSelectionScreen(
                                           //transport: "bus",
                                           // from: "from",
                                           // to: "to",
                                          ),
                                        ),
                                       );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF00897B),
                                    ),
                                    child: Text(
                                      "BOOK NOW",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      ),

                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                      ),
                    ),




                    SizedBox(height: 6),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
