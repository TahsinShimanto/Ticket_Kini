import 'package:flutter/material.dart';
import 'package:ticket_kini/home_page.dart';

import 'my_account.dart';
import 'ticketdetails.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyTicketsTab extends StatefulWidget {
  const MyTicketsTab({super.key});

  @override
  State<MyTicketsTab> createState() => _MyTicketsTabState();
}

class _MyTicketsTabState extends State<MyTicketsTab> {
  int idx = 1;


//=======================deletePastTickets============================================================
  @override
  void initState() {
    super.initState();
    _deletePastTickets();
  }

  Future<void> _deletePastTickets() async {
    final String uid = FirebaseAuth.instance.currentUser?.uid ?? "";
    if (uid.isEmpty) return;

    final today = DateTime.now();
    final todayDateOnly = DateTime(today.year, today.month, today.day);
    final dateFormat = DateFormat('dd-MM-yyyy');

    final snapshot = await FirebaseFirestore.instance
        .collection('tickets')
        .where('userId', isEqualTo: uid)
        .get();

    final batch = FirebaseFirestore.instance.batch();
    for (final doc in snapshot.docs) {
      final data = doc.data();
      try {
        final journeyDate = dateFormat.parse(data['date'] ?? '');
        if (journeyDate.isBefore(todayDateOnly)) {
          batch.delete(doc.reference);
        }
      } catch (_) {}
    }
    await batch.commit();
  }

  //===================================================================================

  @override
  Widget build(BuildContext context) {

    String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Tickets',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF00897B),letterSpacing: 1.2),),
      ),body:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('tickets')
            .where('userId', isEqualTo: uid)

            .snapshots(),
        builder: (context, snapshot) {


          if (!snapshot.hasData) {
            return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.confirmation_number_outlined, size: 80,
                    color: Colors.grey),
                Text("No tickets booked yet",
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
          );
          }

          final tickets = snapshot.data!.docs.toList()

//======================for sorting date of ticket===================================================================
            ..sort((a, b) {
              final dateFormat = DateFormat('dd-MM-yyyy');
              final aData = a.data() as Map<String, dynamic>;
              final bData = b.data() as Map<String, dynamic>;
              try {
                final aDate = dateFormat.parse(aData['date'] ?? '01-01-2000');
                final bDate = dateFormat.parse(bData['date'] ?? '01-01-2000');
                return aDate.compareTo(bDate);
              } catch (_) {
                return 0;
              }
            });
//===================================================================================
          if (tickets.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.confirmation_number_outlined, size: 80,
                      color: Colors.grey),
                  Text("No tickets booked yet",
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            );
          }
          return  ListView.builder(

              itemCount: tickets.length,
              itemBuilder: (context, index) {
                var ticketData = tickets[index].data() as Map<String, dynamic>;

                final bool isBus = ticketData['transportType'] == 'Bus';

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TicketDetails(ticket: ticketData)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4))
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric( horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF00897B).withValues(alpha: 0.15),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)), // for rasius of upper border
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(isBus? Icons.directions_bus : Icons.train,color: Color(0xFF00897B) ),
                                    SizedBox(width: 10),
                                    Text(ticketData['transportName'],
                                      style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                                  ],
                                ),
                                 Text(
                                  ticketData['transportType'],
                                  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF00897B)),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric( horizontal: 15, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(

                                  children: [
                                    Text(
                                      "From",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(ticketData['from'],style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [

                                    Icon(Icons.arrow_forward,
                                        color: Colors.grey),
                                  ],
                                ),
                                Column(

                                  children: [
                                    Text(
                                      "To",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(ticketData['to'],style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(height: 20, color: Colors.grey,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric( horizontal: 15, vertical: 1),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Date: ${ticketData['date']}",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text("Seats: ${ticketData['selectedSeats'].join(', ')}",style: TextStyle(fontWeight: FontWeight.bold)),

                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                  decoration: BoxDecoration(color: Color(0xFF00897B), borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "৳${ticketData['totalAmount']}",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                );
              });
        })
      , // body






      bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          onTap: (index){
            if(index==0) Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
            if(index==2) Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAccount()));
            setState(() {
              idx = index;
            });
          },
          selectedItemColor: Color(0xFF00897B),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.confirmation_num_outlined),label: 'My Ticket'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account')
          ]),
    );
  }
}
