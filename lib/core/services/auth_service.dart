import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> checkAuthState() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final token = await currentUser.getIdToken();
      print('=== Auth State ===');
      print('User is logged in');
      print('User ID: ${currentUser.uid}');
      print('User Email: ${currentUser.email}');
      print('User Token: $token');
      print('================');
    } else {
      print('No user is logged in');
    }
  }

  Stream<User?> authStateChanges() => _auth.authStateChanges();
}
