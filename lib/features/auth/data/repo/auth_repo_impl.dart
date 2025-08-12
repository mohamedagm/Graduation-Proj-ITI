import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iti_project/core/errors/email_password_failure.dart';
import 'package:iti_project/core/errors/failures.dart';
import 'package:iti_project/core/errors/google_sign_in_failure.dart';
import 'package:iti_project/core/services/firebase_service.dart';
import 'package:iti_project/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseService firebaseService;
  const AuthRepoImpl(this.firebaseService);
  @override
  Future<Either<Failures, UserCredential>> loginEmailPasswordR(
    String email,
    String password,
  ) async {
    try {
      var result = await firebaseService.signInWithEmailPassword(
        email,
        password,
      );
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(EmailPasswordFailure.fromCode(e.code));
    } catch (e) {
      return left(EmailPasswordFailure.fromCode(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserCredential>> registerEmailPasswordR(
    String email,
    String password,
  ) async {
    try {
      var result = await firebaseService.createUserWithEmailPassword(
        email,
        password,
      );
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(EmailPasswordFailure.fromCode(e.code));
    } catch (e) {
      return left(EmailPasswordFailure.fromCode(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserCredential>> signInWithGoogleR() async {
    try {
      var result = await firebaseService.signInWithGoogle();
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(GoogleSignInFailure.fromCode(e.code));
    } on GoogleSignInException catch (e) {
      return left(GoogleSignInFailure.fromCode(e.toString()));
    } catch (e) {
      return left(GoogleSignInFailure.fromCode(e.toString()));
    }
  }
}
