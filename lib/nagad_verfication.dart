import 'package:flutter/material.dart';
import 'sucess_screen.dart';
import 'checkout_screen.dart';
import 'bKash_pin.dart';
import 'nagad_screen.dart';
import 'nagad_pin.dart';
class NagadVerfication extends StatefulWidget {
  final Map<String, dynamic> ticketData;
  NagadVerfication({super.key, required this.ticketData});

  @override
  State<NagadVerfication> createState() => _NagadVerfication();
}

class _NagadVerfication extends State<NagadVerfication> {
  bool obsecure = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Image.asset(
              "assets/nagad.png",
              height: 150,
              width: double.infinity,
            ),

            Container(
              height: 10,
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
                  "90  ",
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
                        "Enter verification code ",
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
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nagad Verification Code',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (val) {
                        if (val == null ||
                            val.isEmpty ||
                            int.tryParse(val) == null) {
                          return 'Enter a valid Code';
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
                    child: Text("CLOSE"),
                  ),
                ),
                Expanded(
                  child:ElevatedButton(
                    onPressed:()async{
                      //await FirebaseFirestore.instance.collection('tickets').add(ticketData);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) =>NagadPin(ticketData: widget.ticketData)),
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
    );

  }
}