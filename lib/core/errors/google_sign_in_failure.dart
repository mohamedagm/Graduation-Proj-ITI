import 'failures.dart';

class GoogleSignInFailure extends Failures {
  const GoogleSignInFailure(super.errMessage);

  factory GoogleSignInFailure.fromCode(String code) {
    switch (code) {
      case 'canceled':
        return const GoogleSignInFailure(
          'Sign-in process was cancelled by the user.',
        );
      case 'interrupted':
        return const GoogleSignInFailure(
          'The sign-in process was interrupted.',
        );
      case 'uiUnavailable':
        return const GoogleSignInFailure(
          'Google Sign-In UI is not available on this device.',
        );
      case 'unknownError':
        return const GoogleSignInFailure(
          'An unknown error occurred during Google Sign-In.',
        );
      default:
        return const GoogleSignInFailure(
          'An unexpected error occurred during Google Sign-In.',
        );
    }
  }
}
