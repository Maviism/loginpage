import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signInAnnonymus() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //SignUp
  static Future<User> signUp(String email, String pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User firebase = result.user;

      return firebase;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //SignIn
  static Future<User> signIn(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User firebase = result.user;

      return firebase;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User> get userStream => _auth.authStateChanges();
}
