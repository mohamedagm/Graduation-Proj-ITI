import 'failures.dart';

class EmailPasswordFailure extends Failures {
  const EmailPasswordFailure(super.errMessage);

  factory EmailPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const EmailPasswordFailure('The email address is not valid.');
      case 'user-disabled':
        return const EmailPasswordFailure(
          'This user account has been disabled.',
        );
      case 'user-not-found':
        return const EmailPasswordFailure('No user found for this email.');
      case 'wrong-password':
        return const EmailPasswordFailure(
          'Incorrect password provided for this user.',
        );
      case 'too-many-requests':
        return const EmailPasswordFailure(
          'Too many attempts. Please try again later.',
        );
      case 'email-already-in-use':
        return const EmailPasswordFailure(
          'The email address is already in use by another account.',
        );
      case 'weak-password':
        return const EmailPasswordFailure('The password provided is too weak.');
      case 'operation-not-allowed':
        return const EmailPasswordFailure(
          'Email/Password accounts are not enabled. Please contact support.',
        );
      default:
        return const EmailPasswordFailure(
          'An unknown error occurred during Email/Password operation.',
        );
    }
  }
}
