import 'package:flutter/material.dart';

import 'newresult_screen.dart';
import 'package:intl/intl.dart';
class SearchScreen extends StatefulWidget {
  final String transportType;
  SearchScreen({required this.transportType});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? fromLocation;
  String? toLocation;
  DateTime? datePicked;

  final List<String> cityList = ["Dhaka", "Chittagong", "Sylhet", "Rajshahi", "Khulna", "Rangpur", "Barishal", "Mymensingh"];
  @override
  Widget build(BuildContext context) {

    Color themeColor = const Color(0xFF00897B);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search ${widget.transportType} ",
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("From", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on,color: themeColor,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: DropdownButton<String>(

                      value: fromLocation,
                      hint: Text("Select Destination City"),
                      isExpanded: true,
                      underline: SizedBox(),
                      items: cityList.map((e) =>
                          DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (val) => setState(() => fromLocation = val),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(height: 20),

            Text("To", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_searching,color: themeColor,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: DropdownButton<String>(

                      value: toLocation,
                      hint: Text("Select Destination City"),
                      isExpanded: true,
                      underline: SizedBox(),
                      items: cityList.map((e) =>
                          DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (val) => setState(() => toLocation = val),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Journey Date", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
//===================================calender=======================================================

           GestureDetector(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 10)),);

                if(picked!=null){
                  setState(() => datePicked = picked);
                }

              },

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.calendar_month, color: themeColor),
                    SizedBox(width: 15,),
                    Text(
                      datePicked == null
                          ? "Select Journey Date"
                          : DateFormat('dd MMMM yyyy').format(datePicked!),
                      style: TextStyle(fontSize: 16,color: datePicked == null ? Color(0xFF757575) : Colors.black,),
                    ),

                  ],
                ),
              ),
            ),
//===============================================================================================================================

            Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: themeColor),

                onPressed: () {
                  if (fromLocation == null || toLocation == null|| datePicked==null) {
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
                        builder: (context) => TransportListScreen(
                        type:widget.transportType,
                        date: DateFormat('dd-MM-yyyy').format(datePicked!),
                        from: fromLocation!,
                        to: toLocation!,
                        ),
                      ),
                    );
                },

                child: Text(
                  "Search ${widget.transportType}",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),

              ),
            )

          ],
        ),


      ),
    );
  }

}

