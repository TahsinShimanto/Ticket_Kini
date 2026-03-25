import 'package:flutter/material.dart';
import 'sucess_screen.dart';
class NagadScreen extends StatefulWidget {
  NagadScreen({super.key});

  @override
  State<NagadScreen> createState() => _NagadScreen();
}

class _NagadScreen extends State<NagadScreen> {
  bool obsecure = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
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
                            Icon(Icons.payment_outlined, color: Colors.deepOrangeAccent),
                            const SizedBox(width: 3),
                            Text(
                              "Nagad Payment",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Nagad number",
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
                                    color: Colors.deepOrangeAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepOrangeAccent, width: 2),
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
                                    color: Colors.deepOrangeAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepOrangeAccent, width: 2),
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
                  backgroundColor: Colors.deepOrangeAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async{
                  //await FirebaseFirestore.instance.collection('tickets').add(ticketData);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SucessScreen()),
                  );

                },
                child: Text(
                  "Pay 120 via Nagad",
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