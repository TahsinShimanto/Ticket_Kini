import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'home_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'my_ticket.dart';
class TicketDetails extends StatelessWidget {

  final Map<String, dynamic> ticket;

  TicketDetails({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Electronic Ticket",
          style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 650,
          width: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)],
          ),
          child: Column(
            children: [
              QrImageView(
                data: "${ticket['date']} ${ticket['departureTime']}",
                version: QrVersions.auto,
                size: 200.0,
              ),  //use for qr show

              Text("Scan for Check-in" ,style: TextStyle(color: Colors.grey),),
              Divider(height: 30,thickness: 1,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transport",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ticket['transportName'],
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Type",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ticket['transportType'],
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ticket['from'],
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Destination",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ticket['to'],
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Journey Date",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ticket['date'],
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),


              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Journey Time",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ticket['departureTime'],
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),


              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Seats",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    (ticket['selectedSeats'] as List).join(', '),
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '৳${ticket['totalAmount']}',
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Confirmed",
                    style: const TextStyle(fontSize: 16,color: Color(0xFF00897B),fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[ ElevatedButton(onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.white,
                        duration: Duration(seconds: 1),
                        content: Text("Ticket is downloaded",style: TextStyle(fontSize: 18,color: Color(0xFF00897B))),
                      )
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }, style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00897B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),child: Text(
                  "Download",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),),
                  //SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    showDialog(context: context,
                      builder: (context)=> AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        insetPadding: EdgeInsets.symmetric(horizontal: 20),
                        title: Text("Cancel Ticket"),
                        content: Text("Are you sure you want to cancel this ticket?"),
                        actions: [
                          ElevatedButton(onPressed: ()=>Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(color: Color(0xFF00897B), width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text("No,Don't Cancel")),
                          SizedBox(width: 10,),
                          ElevatedButton(onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection('tickets')
                                .doc(ticket['ticketId'])
                                .delete();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  MyTicketsTab()),
                            );
                          },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF00897B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text("Yes,Cancel",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
                        ],
                      ),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00897B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Cancel Ticket", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  )
                    ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}