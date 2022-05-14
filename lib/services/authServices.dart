import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);
  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<Object> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged In";
    } catch (e) {
      return e;
    }
  }

  Future<Object> signup(String email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } catch (e) {
      return e;
    }
  }
}
