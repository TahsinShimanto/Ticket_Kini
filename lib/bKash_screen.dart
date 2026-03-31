import 'package:flutter/material.dart';
import 'sucess_screen.dart';
import 'checkout_screen.dart';
class BkashScreen extends StatefulWidget {
  final Map<String, dynamic> ticketData;
  BkashScreen({super.key, required this.ticketData});

  @override
  State<BkashScreen> createState() => _BkashScreen();
}

class _BkashScreen extends State<BkashScreen> {
  bool obsecure = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          // ✅ Scrollable area
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 200),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(blurRadius: 10, color: Colors.black12)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.payment_outlined, color: Colors.pinkAccent),
                            const SizedBox(width: 3),
                            Text(
                              "bKash Payment",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("bKash number",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: phoneController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              labelText: '01XXXXXXXXX',
                              labelStyle: TextStyle(color: Colors.grey),
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
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("PIN", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: obsecure,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obsecure = !obsecure;
                                  });
                                },
                                icon: Icon(Icons.remove_red_eye),
                              ),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              labelText: 'PIN',
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty || val.length < 6) {
                                return 'Enter a valid password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),


          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black12),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async{
                  //await FirebaseFirestore.instance.collection('tickets').add(ticketData);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SucessScreen(ticketData: widget.ticketData)),
                  );

                },
                child: Text(
                  "Pay 120 via bKash",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}