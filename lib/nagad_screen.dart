import 'package:flutter/material.dart';
import 'package:ticket_kini/nagad_verfication.dart';
import 'sucess_screen.dart';
import 'bKash_verification.dart';
class NagadScreen extends StatefulWidget {
  final Map<String, dynamic> ticketData;
  NagadScreen({super.key, required this.ticketData});

  @override
  State<NagadScreen> createState() => _NagadScreen();
}

class _NagadScreen extends State<NagadScreen> {
  bool obsecure = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.deepOrange),
                ),
                child:Image.asset(
                  "assets/nagad2.png",
                  height: 80,
                  width: double.infinity,
                ) ,
              ),
              SizedBox(height: 5,),

              Container(
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "  Total Payment",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "৳${widget.ticketData['totalAmount']}  ",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Nagad Account number ",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: phoneController,
                        obscureText: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'e.g 01XXXXXXXXX',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (val) {
                          if (val == null ||
                              val.isEmpty ||
                              int.tryParse(val) == null) {
                            return 'Enter a valid Number';
                          }
                          return null;
                        },
                      ),
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),

                      ),
                      child: Text("BACK"),
                    ),
                  ),
                  Expanded(
                    child:ElevatedButton(
                      onPressed:()async{
                        //await FirebaseFirestore.instance.collection('tickets').add(ticketData);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) =>NagadVerfication(ticketData: widget.ticketData)),
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),

                      ),
                      child: Text("CONFIRM"),
                    ),
                  ),


                ],
              )




            ],
          ),
        ),
      ),
    );

  }
}