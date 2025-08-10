import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth auth;
  FirebaseService(this.auth);

  Future<UserCredential> createUserWithEmailPassword(
    String email,
    String password,
  ) async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // 1. Initialize Google Sign-In
    await GoogleSignIn.instance.initialize(
      clientId:
          '47431059902-bvd67ska4hp07jekvvmrhhb58e0rftvk.apps.googleusercontent.com',
    );
    // 2. Authenticate user interactively
    final GoogleSignInAccount googleUser =
        await GoogleSignIn.instance.authenticate();
    // 3. Get ID token from the authenticated user
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    // 4. Create Firebase credential from Google token
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    // 5. Sign in to Firebase with that credential
    final userCredential = await auth.signInWithCredential(credential);
    return userCredential;
  }
}
