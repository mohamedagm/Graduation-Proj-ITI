import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_project/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserCredential>> registerEmailPasswordR(
    String email,
    String password,
  );
  Future<Either<Failures, UserCredential>> loginEmailPasswordR(
    String email,
    String password,
  );
  Future<Either<Failures, UserCredential>> signInWithGoogleR();
}
