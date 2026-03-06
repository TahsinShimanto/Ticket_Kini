import 'package:flutter/material.dart';
import 'results_screen.dart';

class SearchScreen extends StatefulWidget {
  final String transportType;
  SearchScreen({required this.transportType});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? fromLocation;
  String? toLocation;


  final List<String> locations = ["Dhaka", "Chittagong", "Sylhet", "Rajshahi", "Khulna", "Rangpur"];



  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color(0xFF00897B);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search ${widget.transportType}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
              color: Colors.white,
          ),
        ),

        backgroundColor: Colors.teal,
        centerTitle: true,
      ),



      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("From", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(border: OutlineInputBorder(), prefixIcon: Icon(Icons.location_on, color: themeColor)),
              initialValue: fromLocation,
              hint: Text("Select Departure City"),
              items: locations.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => fromLocation = val),
            ),

            SizedBox(height: 20),


            Text("To", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(border: OutlineInputBorder(), prefixIcon: Icon(Icons.location_searching, color: themeColor)),
              initialValue: toLocation,
              hint: Text("Select Destination City"),
              items: locations.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => toLocation = val),
            ),

            SizedBox(height: 20),


            Text("Journey Date", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            GestureDetector(

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calendar_month, color: themeColor),
                  ],
                ),
              ),
            ),

            Spacer(),


            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: themeColor),
                onPressed: () {
                  if (fromLocation == null || toLocation == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all details")),
                    );
                    return;
                  }


                  if (fromLocation == toLocation) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Departure and Destination cannot be the same!"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                        type: widget.transportType,
                        from: fromLocation!,
                        to: toLocation!,
                      ),
                    ),
                  );


                },
                child: Text("SEARCH ${widget.transportType.toUpperCase()}",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}