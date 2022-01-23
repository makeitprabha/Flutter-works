import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> userRegistration(String email, String password) async {
    UserCredential _authResult =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    User? _user = _authResult.user;
    _user!.updateDisplayName(email.split("@")[0].toString());
    return _authResult;
  }

  Future<UserCredential> userLogin(String email, String password) async {
    UserCredential _authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return _authResult;
  }

  Future<void> userSignOut() async {
    await _firebaseAuth.signOut();
  }
}
