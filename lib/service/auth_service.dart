import 'package:firebase_auth/firebase_auth.dart';
import 'package:goodchat_water/service/database_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login

  // register
  Future registerUserWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        // call database to update user data
        await DatabaseService(uid: user.uid).updateUserData(fullName, email);

        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e;
    }
  }

  // signout

}
