import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //signup
Future<String?> signup(String name, String phone,String nid,String password) async{
  try{
    String fakeEmail = '$phone@ticketkini.com';

    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: fakeEmail, password: password);

    User? user = result.user;

    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'name': name,
        'phone': phone,
        'nid': nid,
        'uid': user.uid,
        'createdAt': DateTime.now(),
      });
    }
    return null;
  }

  catch(e){
    return e.toString();
  }
}

//login
  Future<String?> login(String phone, String password) async {
    try {
      String fakeEmail = '$phone@ticketkini.com';

      await _auth.signInWithEmailAndPassword(
        email: fakeEmail,
        password: password,
      );

      return null;
    } catch (e) {
      return e.toString();
    }
  }
  //updatepass
Future<String?> updatePassword(String newPassword) async
{
  try{
    User? user = _auth.currentUser;
    if(user!=null)
      {
       await user.updatePassword(newPassword);
      }
    else return null;
  }
  catch(e){
    return e.toString();
  }
}
  //logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}

