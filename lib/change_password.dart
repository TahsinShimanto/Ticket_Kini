import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_service.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool obsecureNewPass = true;
  bool obsecureConfirmPass = true;
  final key = GlobalKey<FormState>();
  AuthService _authService = AuthService();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text('Change Password',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF00897B),),),
      ),

      body: SafeArea(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.all(4),
              child: Form(
                key: key,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight*0.05,),
                    SizedBox(
                      width: screenWidth*0.85,
                      height: screenHeight*0.07,
                      child: TextFormField(
                        controller: newPassController,
                        obscureText: obsecureNewPass,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                obsecureNewPass = !obsecureNewPass;
                              });
                            }, icon: Icon(Icons.remove_red_eye)),

                            labelText: 'New Password',
                          border: OutlineInputBorder()
                        ),

                        validator: (val){
                          if(val==null || val.isEmpty || val.length<6)
                            {
                              return 'Password must be at least 6 characters';
                            }
                          else return null;
                        },

                      ),
                    ),
                    SizedBox(height: screenHeight*0.03,),

                    SizedBox(
                      width: screenWidth*0.85,
                      height: screenHeight*0.07,
                      child: TextFormField(
                        controller: confirmPassController,
                        obscureText: obsecureConfirmPass,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_reset_outlined),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                obsecureConfirmPass = !obsecureConfirmPass;
                              });
                            }, icon: Icon(Icons.remove_red_eye)),

                            labelText: 'Confirm Password',
                            border: OutlineInputBorder()
                        ),
                        validator: (val){
                          if(val==null || val.isEmpty || val.length<6)
                          {
                            return 'Password must be at least 6 characters';
                          }
                          if(val!=newPassController.text)
                            {
                              return "Password doesn't match";
                            }
                          else return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight*0.03,),
                    ElevatedButton(
                      onPressed: () async {
                        if(key.currentState!.validate())
                          {
                           String? error = await _authService.updatePassword(newPassController.text);
                           if(error==null)
                             {
                               ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                     backgroundColor: Colors.white60,
                                     duration: Duration(seconds: 1),
                                     content: Text('Password changed Successfully',style: TextStyle(fontSize: 18,color: Color(0xFF00897B))),
                                   )
                               );
                               Navigator.pop(context);
                             }
                            else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.white60,
                                      duration: Duration(seconds: 1),
                                      content: Text('Password change Failed',style: TextStyle(fontSize: 18,color: Colors.red)),
                                    )
                                );
                              }
                          }

                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(screenWidth * 0.8, screenHeight * 0.055),
                        backgroundColor: Color(0xFF00897B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text('Save Changes', style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
