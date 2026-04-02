import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class SeatSelectionScreen extends StatefulWidget{
  final String transportName;
  final String transportType;
  final String coachName;
  final int fare;
  final String from;
  final String to;
  final String date;
  final String departureTime;
  const SeatSelectionScreen({
    super.key,
    required this.transportName,
    required this.transportType,
    required this.coachName,
    required this.fare,
    required this.from,
    required this.to,
    required this.date,
    required this.departureTime,
  });

  @override
  State<SeatSelectionScreen> createState() =>
      _SeatSelectionScreenState();
}
class _SeatSelectionScreenState extends State<SeatSelectionScreen>{

  List<bool> seatSelected = List.generate(32, (index) => false);
  List<bool> seatBooked = List.generate(32, (index) => false);
  int get selectedCount =>seatSelected.where((seat) => seat).length;
  int get totalAmount=> selectedCount*widget.fare;


  //========================================================================
  List<String> get selectedSeatLabels {
    List<String> labels = [];
    for (int i = 0; i < seatSelected.length; i++) {
      if (seatSelected[i]) labels.add('S${i + 1}');
    }
    return labels;
  }
  //================================================================



  void initState(){
    super.initState();
    seatBooked[2]=true;
    seatBooked[4]=true;
    seatBooked[6]=true;
    seatBooked[8]=true;
    seatBooked[31]=true;
    seatBooked[10]=true;
    seatBooked[15]=true;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Select Seats - ${widget.transportType}",
            style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),
          ),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),


        body: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height:10,
                  width: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border:Border.all(
                          color: Colors.black
                      )

                  ),

                ),
                const SizedBox(width: 5),
                Text("Avaiable"),

                const SizedBox(width: 20),
                Container(
                  height: 10,
                  width: 10,
                  color: Color(0xFF00897B),
                ),

                const SizedBox(width: 10),
                Text("Selected"),
                const SizedBox(width: 20),
                Container(
                  height: 10,
                  width: 10,
                  color: Colors.blueGrey,
                ),

                const SizedBox(width: 10),
                Text("Booked"),



              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatBox(0),
                const SizedBox(width: 5),
                seatBox(1),
                const SizedBox(width: 70),
                seatBox(2),
                const SizedBox(width: 5),
                seatBox(3),
                const SizedBox(width: 5),


              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatBox(4),
                const SizedBox(width: 5),
                seatBox(5),
                const SizedBox(width: 70),
                seatBox(6),
                const SizedBox(width: 5),
                seatBox(7),
                const SizedBox(width: 5),


              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatBox(8),
                const SizedBox(width: 5),
                seatBox(9),
                const SizedBox(width: 70),
                seatBox(10),
                const SizedBox(width: 5),
                seatBox(11),
                const SizedBox(width: 5),


              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatBox(12),
                const SizedBox(width: 5),
                seatBox(13),
                const SizedBox(width: 70),
                seatBox(14),
                const SizedBox(width: 5),
                seatBox(15),
                const SizedBox(width: 5),


              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatBox(16),
                const SizedBox(width: 5),
                seatBox(17),
                const SizedBox(width: 70),
                seatBox(18),
                const SizedBox(width: 5),
                seatBox(19),
                const SizedBox(width: 5),


              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatBox(20),
                const SizedBox(width: 5),
                seatBox(21),
                const SizedBox(width: 70),
                seatBox(22),
                const SizedBox(width: 5),
                seatBox(23),
                const SizedBox(width: 5),


              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatBox(24),
                const SizedBox(width: 5),
                seatBox(25),
                const SizedBox(width: 70),
                seatBox(26),
                const SizedBox(width: 5),
                seatBox(27),
                const SizedBox(width: 5),


              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatBox(28),
                const SizedBox(width: 5),
                seatBox(29),
                const SizedBox(width: 70),
                seatBox(30),
                const SizedBox(width: 5),
                seatBox(31),
                const SizedBox(width: 5),


              ],
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
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
                        "Total: $totalAmount",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00897B),
                      foregroundColor: Colors.white,
                    ),

                    onPressed:selectedCount==0
                        ? null
                        :() {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:(_)=>
                              CheckoutScreen(
                                transportName: widget.transportName,
                                transportType: widget.transportType,
                                coachName: widget.coachName,
                                from: widget.from,
                                to: widget.to,
                                date: widget.date,
                                departureTime: widget.departureTime,
                                selectedSeats: selectedSeatLabels,
                                totalAmount: totalAmount,
                              ),
                        ),
                      );

                    },

                      child: Text(
                        "Confirm Booking",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),

                  ),


                ],
              ),



            )

          ],
        )




    );



  }

  Widget seatBox(int index) {
    return GestureDetector(
      onTap:seatBooked[index]
           ?null
          :() {
        setState(() {
          seatSelected[index]=!seatSelected[index];

        });
      },
      child: Container(
        height: 60,
        width: 60,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:seatBooked[index]
               ? Colors.blueGrey
              : seatSelected[index]
              ? Color(0xFF00897B)
              :Colors.grey.shade300,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.event_seat,
          color: Colors.black54,
        ),
      ),
    );
  }
}
