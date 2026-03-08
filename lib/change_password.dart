import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Change Password',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF00897B),),),
      ),

      body: SafeArea(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.all(4),
              child: Column(
                children: [
                  SizedBox(height: screenHeight*0.05,),
                  SizedBox(
                    width: screenWidth*0.85,
                    height: screenHeight*0.07,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        labelText: 'New Password',
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.03,),

                  SizedBox(
                    width: screenWidth*0.85,
                    height: screenHeight*0.07,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.sticky_note_2_rounded),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.03,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth * 0.7, screenHeight * 0.06),
                      backgroundColor: Color(0xFF00897B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Save Changes', style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
