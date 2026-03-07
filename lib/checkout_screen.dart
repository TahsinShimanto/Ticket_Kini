import 'package:flutter/material.dart';
import 'sucess_screen.dart';
class CheckoutScreen extends StatefulWidget{
  const CheckoutScreen({super.key});
  @override
  State<CheckoutScreen>createState()=>
      _CheckoutScreenState();
}
class _CheckoutScreenState extends State<CheckoutScreen>{
  String selectedMethod = "bKash";
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Checkout",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
                  color: Colors.blue,

                ),
                padding: EdgeInsets.all(10.0),
              ),

              Container(
                height: 2,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
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
                  color: Colors.blue,

                ),
                padding: EdgeInsets.all(10.0),

              ),
              Container(
                height: 2,
                width: 30,
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
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                "Payment",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                "Ticket",
                style: TextStyle(
                  color: Colors.blue,
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
                      "Bus Express A",
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
                      "Bus",
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
                      "6",
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
                      "18-02-2026",
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
                      "500.00",
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
                      "20.00",
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
                      "520.00",
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
                  color: selectedMethod == "bKash" ? Colors.red : Colors.transparent,
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
                          fontSize: 7,
                        ),
                      ),

                    ],

                  ),
                  const SizedBox(width: 250),

                  if (selectedMethod == "bKash")
                    Icon(Icons.check_circle, color: Colors.red),
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
                    color: selectedMethod == "Nagad" ? Colors.red : Colors.transparent,
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
                      Icon(Icons.check_circle, color: Colors.red),

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
                  color: selectedMethod == "Visa/Mastercard" ? Colors.red : Colors.transparent,
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
                    Icon(Icons.check_circle, color: Colors.red),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(30),
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
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(_)=>
                            SucessScreen(),

                      ),
                    );
                  }, child: Text("confirm & pay")),
            ),
          ),










        ],
      ),

    );
  }


}
