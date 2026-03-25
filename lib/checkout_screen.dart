import 'package:flutter/material.dart';
import 'sucess_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CheckoutScreen extends StatefulWidget {
  final String transportName;
  final String transportType;
  final String coachName;
  final String from;
  final String to;
  final String date;
  final String departureTime;
  final List<String> selectedSeats;
  final int totalAmount;

  const CheckoutScreen({
    super.key,
    required this.transportName,
    required this.transportType,
    required this.coachName,
    required this.from,
    required this.to,
    required this.date,
    required this.departureTime,
    required this.selectedSeats,
    required this.totalAmount,
  });
  @override
  State<CheckoutScreen>createState()=>
      _CheckoutScreenState();
}
class _CheckoutScreenState extends State<CheckoutScreen>{
  String selectedMethod = "bKash";

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
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
                child: Text(
                  "1",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF00897B),

                ),
                padding: EdgeInsets.all(10.0),
              ),

              Container(
                height: 2,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xFF00897B),
                ),

              ),
              Container(
                child: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF00897B),

                ),
                padding: EdgeInsets.all(10.0),

              ),
              Container(
                height: 2,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey,
                ),

              ),
              Container(
                child: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,

                ),
                padding: EdgeInsets.all(10.0),

              ),

            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Seats",
                style: TextStyle(
                  color: Color(0xFF00897B),
                ),
              ),
              const SizedBox(width: 30),
              Text(
                "Payment",
                style: TextStyle(
                  color: Color(0xFF00897B),
                ),
              ),
              const SizedBox(width: 30),
              Text(
                "Ticket",
                style: TextStyle(
                  color: Color(0xFF00897B),
                ),
              ),


            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transport",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      widget.transportName,
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
                      widget.transportType,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(height: 5),
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
                      widget.selectedSeats.join(", "),
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
                      widget.date,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 3,
                      width: 359,
                      color: Colors.grey,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Base Fare",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "৳${widget.totalAmount}",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Service",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "৳20.00",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "৳${widget.totalAmount+20}",
                      style: const TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ],
            ),

          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Text(
                "Selected Payment Method",
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: (){
              setState(() {
                selectedMethod="bKash";
              });
            },

            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selectedMethod == "bKash" ? Colors.green : Colors.transparent,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.pinkAccent,

                  ),
                  const SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "bKash",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      const SizedBox(height: 2),
                      Text(
                        "Mobile wallet",
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),

                    ],

                  ),
                  const SizedBox(width: 250),

                  if (selectedMethod == "bKash")
                    Icon(Icons.check_circle, color: Colors.green),
                ],


              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              setState(() {
                selectedMethod="Nagad";
              });
            },

            child:Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selectedMethod == "Nagad" ? Colors.green : Colors.transparent,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.amberAccent,

                    ),
                    const SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nagad",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Mobile wallet",
                          style: TextStyle(
                            fontSize: 7,
                          ),
                        )

                      ],


                    ),
                    const SizedBox(width: 250),

                    if (selectedMethod == "Nagad")
                      Icon(Icons.check_circle, color: Colors.green),

                  ],
                )
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                selectedMethod="Visa/Mastercard";
              });
            },

            child:Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selectedMethod == "Visa/Mastercard" ? Colors.green : Colors.transparent,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.credit_card,
                    color: Colors.blue,

                  ),
                  const SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Visa/Mastercard",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "debit or creditcard                    ",
                        style: TextStyle(
                          fontSize: 7,
                        ),
                      )

                    ],


                  ),
                  const SizedBox(width: 180),

                  if (selectedMethod == "Visa/Mastercard")
                    Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black12,
                )
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00897B),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
//=================================firebase========================S===========================================

                    String uid = FirebaseAuth.instance.currentUser?.uid ?? "unknown";  //get uid


                    Map<String, dynamic> ticketData = {
                      'userId': uid,
                      'transportName': widget.transportName,
                      'transportType': widget.transportType,
                      'coachName': widget.coachName,
                      'from': widget.from,
                      'to': widget.to,
                      'date': widget.date,
                      'departureTime': widget.departureTime,
                      'selectedSeats': widget.selectedSeats,
                      'totalAmount': widget.totalAmount + 20,
                      'paymentMethod': selectedMethod,
                      'bookedAt': FieldValue.serverTimestamp(),
                    };

                    DocumentReference ref = await FirebaseFirestore.instance
                        .collection('tickets')
                        .add(ticketData);

                    await ref.update({'ticketId': ref.id});


                   // FirebaseFirestore.instance.collection('tickets').add(ticketData);  //push

//================================================================================================================
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(_)=>
                            SucessScreen(),

                      ),
                    );
                  }, child: Text(
                "Confirm & Pay",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              )),
            ),
          ),

        ],
      ),

    );
  }


}
