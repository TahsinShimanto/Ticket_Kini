import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class SeatSelectionScreen extends StatefulWidget{
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() =>
      _SeatSelectionScreenState();
}
class _SeatSelectionScreenState extends State<SeatSelectionScreen>{

  List<bool> seatSelected = List.generate(32, (index) => false);
  int get selectedCount =>
      seatSelected.where((seat) => seat).length;
  int get totalAmount=>
      selectedCount*750;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Select Seats - X"),
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

              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatBox(0),
                const SizedBox(width: 5),
                seatBox(1),
                const SizedBox(width: 5),
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
                const SizedBox(width: 5),
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
                const SizedBox(width: 5),
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
                const SizedBox(width: 5),
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
                const SizedBox(width: 5),
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
                const SizedBox(width: 5),
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
                const SizedBox(width: 5),
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
                const SizedBox(width: 5),
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
                        "Total:s $totalAmount",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),

                    onPressed:selectedCount==0
                        ? null
                        :() {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:(_)=>
                              CheckoutScreen(),
                        ),
                      );

                    },
                    child:Text("Confirm Booking"),
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
      onTap: () {
        setState(() {
          seatSelected[index]=!seatSelected[index];

        });
      },
      child: Container(
        height: 60,
        width: 60,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: seatSelected[index]
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
