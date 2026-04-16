import 'package:flutter/material.dart';
import 'sucess_screen.dart';
class CardScreen extends StatefulWidget {

  final Map<String, dynamic> ticketData;
  CardScreen({super.key,
    required this.ticketData,

  });

  @override
  State<CardScreen> createState() => _CardScreen();
}

class _CardScreen extends  State<CardScreen>{
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  bool obsecure = true;
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 30,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
              child:SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 150),
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(blurRadius: 10, color: Colors.black12)
                        ],
                      ),
                      child:Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(blurRadius: 10, color: Colors.black12)
                              ],
                            ),
                            child:Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.credit_card,color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 36,
                                      height: 24,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEB001B),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),


                                          Positioned(
                                            left: 12,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF79E1B),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "****     ****      ****       **** ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.white,

                                      ),

                                    ),
                                  ],
                                )
                              ],
                            ),


                          ),

                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: cardNumberController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.indigoAccent, width: 2.0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.indigoAccent, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(Icons.credit_card,color: Colors.indigoAccent),
                                labelText: 'Card number',
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

                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: cardHolderController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person,color: Colors.indigoAccent,),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.indigoAccent, width: 2.0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(

                                  borderSide: BorderSide(
                                      color: Colors.indigoAccent, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                labelText: 'CardHolder Name',
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
                          const SizedBox(height: 20),
                          Row(
                            children: [

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5),
                                    TextFormField(
                                      controller: expiryController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.indigoAccent, width: 2.0),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.indigoAccent, width: 2),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        labelText: 'Expiry MM/YY',
                                        labelStyle: TextStyle(color: Colors.grey),
                                      ),
                                      validator: (val) {
                                        if (val == null ||
                                            val.isEmpty ||
                                            int.tryParse(val) == null) {
                                          return 'Enter a valid Date';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 10),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5),
                                    TextFormField(
                                      controller: cvvController,
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
                                              color: Colors.indigoAccent, width: 2.0),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.indigoAccent, width: 2),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        labelText: 'CVV',
                                      ),
                                      validator: (val) {
                                        if (val == null || val.isEmpty || val.length < 4) {
                                          return 'Invalid';
                                        }
                                        return null;
                                      },                                   ),
                                  ],
                                ),
                              ),
                            ],
                          )

                        ],

                      ),


                    ),

                  ],

                ),


              )
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: EdgeInsetsGeometry.symmetric(vertical: 16),
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
                  backgroundColor: Colors.indigoAccent,
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
                  "Pay via card",
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
