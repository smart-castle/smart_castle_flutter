import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_castle/login/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebase(user));
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      // AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);

      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
