import 'package:flutter/material.dart';
import 'home_page.dart';
import 'auth_service.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final key = GlobalKey<FormState>();
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF00897B),
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Color(0xFF00897B),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Center(
          child: SingleChildScrollView(
            child: Container(
                width: screenWidth*0.85,
                height: screenHeight*0.7,
                margin: EdgeInsets.only(bottom: screenHeight*0.1),
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
                        child: Icon(Icons.person_add_alt_1,size: 50,color: Color(0xFF00897B),),
                      ),

                      SizedBox(height: screenHeight*0.04),
            
                      SizedBox(
                        width: screenWidth*0.7,
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_2_outlined),
                              border: OutlineInputBorder(),
                              labelText: 'Full Name'
                          ),
            
                          validator: (val){
                            if(val==null || val.isEmpty )
                              {
                                return 'Enter a valid Name';
                              }
            
                            for(int i=0;i<val.length;i++)
                              {
                                if(!(val[i].codeUnitAt(0)>=65 && val[i].codeUnitAt(0)<=90
                                || val[i].codeUnitAt(0)>=97 && val[i].codeUnitAt(0)<=122
                                || val[i]==' '))
                                  {
                                    return 'Enter a valid Name';
                                  }
                              }
            
                                return null;
            
                          },
            
                        ),
                      ),
                      SizedBox(height: screenHeight*0.03),
            
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
                            if(val == null || val.isEmpty){
                              return 'Enter a valid Number';
                            }
                            if(double.tryParse(val) == null){
                              return 'Enter a valid Number';
                            }
                            // if(!val.startsWith('01')){
                            //   return 'Enter a valid Number';
                            // }
                            return null;
                          },
            
                        ),
                      ),
                      SizedBox(height: screenHeight*0.03),
            
                      SizedBox(
                        width: screenWidth*0.7,
                        child: TextFormField(
                          controller: nidController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.credit_card),
                              border: OutlineInputBorder(),
                              labelText: 'NID Number'
                          ),
            
                          validator: (val){
                            if(val==null || val.isEmpty || int.tryParse(val)==null)
                            {
                              return 'Enter a NID Number';
                            }
                            else
                            {
                              return null;
                            }
                          },
            
                        ),
                      ),
                      SizedBox(height: screenHeight*0.03),
            
                      /*SizedBox(
                        width: screenWidth*0.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.calendar_month),
                              border: OutlineInputBorder(),
                              labelText: 'Date of Birth'
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight*0.03),*/
            
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
                              }, 
                                  icon: Icon(Icons.remove_red_eye)),
                              border: OutlineInputBorder(),
                              labelText: 'Set Password'
                          ),
            
                          validator: (val){
                            if(val==null || val.isEmpty || val.length<6)
                            {
                              return 'Password must be at least 6 characters';
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
                            String? error = await _authService.signup(
                                nameController.text, phoneController.text, nidController.text, passwordController.text
                            );
                            if(error==null)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.white60,
                                      duration: Duration(seconds: 1),
                                      content: Text('Registered Successfully',style: TextStyle(fontSize: 18,color: Color(0xFF00897B))),
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
                                      content: Text('This number is already Registered',style: TextStyle(fontSize: 18,color: Colors.red),)
                                    )
                                );
                              }
            
                          }
                      },
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                              backgroundColor: Color(0xFF00897B),
                              minimumSize: Size(screenWidth*0.65, screenHeight*0.055),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                              )
                          ),
                          child: Text('Register',style: TextStyle(fontSize: 20,color: Colors.white),)
                      ),
            
            
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }
}
