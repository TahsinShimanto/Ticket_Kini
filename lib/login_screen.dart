import 'package:flutter/material.dart';
import 'package:ticket_kini/auth_service.dart';
import 'home_page.dart';
import 'sign_up_page.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecure = true;
  final key = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF00897B),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: screenWidth*0.85,
                    height: screenHeight*0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black12,blurRadius: 20,offset: Offset(1, 1.5)),
                        ]
                    ),
                    child: Form(
                      key: key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth*0.185,
                            height: screenHeight*0.084,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0F2F1),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: Colors.black26,blurRadius: 1,offset: Offset(1, 1.5))
                              ]
                            ),
                            child: Icon(Icons.person,size: 60,color: Color(0xFF00897B),),
                          ),
                          SizedBox(height: screenHeight*0.05),

                          SizedBox(
                            width: screenWidth*0.7,
                            child: TextFormField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(),
                                  labelText: 'Phone Number'
                              ),
                              validator: (val){
                                if(val==null || val.isEmpty || int.tryParse(val)==null)
                                  {
                                    return 'Enter a valid Number';
                                  }
                                else
                                  {
                                    return null;
                                  }
                              },
                            ),
                          ),
                          SizedBox(height: screenHeight*0.04),

                          SizedBox(
                            width: screenWidth*0.7,
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: obsecure,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(onPressed: (){
                                    setState(() {
                                      obsecure = !obsecure;
                                    });
                                  }, icon: Icon(Icons.remove_red_eye)),
                                  border: OutlineInputBorder(),
                                  labelText: 'Password'
                              ),

                              validator: (val){
                                if(val==null || val.isEmpty ||val.length<6)
                                  {
                                    return 'Enter a valid password';
                                  }
                                else
                                  {
                                    return null;
                                  }
                              },

                            ),
                          ),
                          SizedBox(height: screenHeight*0.05),

                          ElevatedButton(onPressed: () async {
                            if(key.currentState!.validate())
                              {

                                String? error = await _authService.login(phoneController.text, passwordController.text);
                                if(error==null)
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Login Successful',style: TextStyle(fontSize: 18,color: Color(0xFF00897B))),
                                          backgroundColor: Colors.white60,
                                          duration: Duration(seconds: 1),
                                        )
                                    );
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                  }
                                else
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.white,
                                          duration: Duration(seconds: 2),
                                          content: Text("Account doesn't exist",style: TextStyle(fontSize: 18,color: Colors.red)),
                                        )
                                    );
                                  }

                              }
                          },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF00897B),
                                  shadowColor: Colors.black,
                                  minimumSize: Size(screenWidth*0.65, screenHeight*0.055),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                                  )
                              ),
                              child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                          SizedBox(height: screenHeight*0.04),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an Account? "),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                },
                                child: Text('Sign Up',style: TextStyle(color: Color(0xFF00897B),fontWeight: FontWeight.bold),),

                              )
                            ],
                          ),
                        ],
                      ),
                    )
                ),
                //bypass
                /*GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Bypass',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25),),
                )*/
              ],
            ),
          )
      ),
    );
  }
}
