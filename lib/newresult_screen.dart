import 'package:flutter/material.dart';

import 'seat_selection_screen.dart';




class TransportListScreen extends StatelessWidget {


  final String type;
  final String from;
  final String to;
  final String date;

   TransportListScreen({
    super.key,
    required this.type,
    required this.from,
    required this.to,
     required this.date,
  });



//-----------------------------------------------------------------------------------------------------
  List get activeTransportList {
    if (type == "Bus") {
      return [
        {"name": "Green Line Paribahan", "time": "08:00 AM"},
        {"name": "Shohagh Paribahan", "time": "09:30 AM"},
        {"name": "Hanif Enterprise", "time": "11:00 AM"},
        {"name": "Saintmartin Hyundai", "time": "02:30 PM"},
        {"name": "Ena Transport", "time": "05:00 PM"},
        {"name": "Desh Travels", "time": "10:30 PM"},
        {"name": "London Express", "time": "11:15 PM"},
        {"name": "Shyamoli NR", "time": "11:45 PM"},
      ];
    } else {
      return transportlist;
    }
  }

  List get activeCoachList {
    if (type == "Bus") {
      return [
        {"name": "NON_AC", "fare": 680, "availableSeats": 40},
        {"name": "AC_ECONOMY", "fare": 1200, "availableSeats": 30},
        {"name": "AC_BUSINESS", "fare": 1500, "availableSeats": 24},
        {"name": "SLEEPER", "fare": 2200, "availableSeats": 18},
        {"name": "HYUNDAI_UNI", "fare": 2000, "availableSeats": 22},
        {"name": "DECKER_AC", "fare": 1300, "availableSeats": 50},
      ];
    } else {
      return coachlist;
    }
  }


//----------------------------------------------------------------------------------------------------

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
          "Available $type",
          style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: activeTransportList.length,
          itemBuilder: (context, index) {
            final item = activeTransportList[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["name"],
                      style: TextStyle(
                        fontSize: 18,
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
                            from,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00897B),
                            ),
                          ),
                          Icon(Icons.arrow_forward, color: Color(0xFF00897B)),
                          Text(
                            to,
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
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: activeCoachList.length,
                        itemBuilder: (context, index) {
                          final coach = activeCoachList[index];
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
                                    fontSize: 12,
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
                                SizedBox(height: 16),
                                Text(
                                  coach["availableSeats"].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00897B),

                                  ),
                                ),
                                SizedBox(height: 14),

                                SizedBox(
                                  width: 150,
                                  height: 25,
                                  child: ElevatedButton(
                                    onPressed: () {

                                      Navigator.push(
                                       context,
                                        MaterialPageRoute(
                                          builder: (context) => SeatSelectionScreen(
                                            transportName:item["name"],
                                            transportType: type,
                                            coachName: coach["name"],
                                           fare: coach["fare"] as int,
                                            from: from,
                                            to: to,
                                            date: date,
                                            departureTime: item["time"],
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

