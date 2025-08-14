import 'package:iti_project/core/errors/failures.dart';

class FirestoreFailure extends Failures {
  const FirestoreFailure(super.errMessage);

  factory FirestoreFailure.fromCode(String code) {
    switch (code) {
      case 'permission-denied':
        return FirestoreFailure(
          'You do not have permission to access this resource.',
        );
      case 'unavailable':
        return FirestoreFailure(
          'The service is currently unavailable. Try again later.',
        );
      case 'not-found':
        return FirestoreFailure('The requested document was not found.');
      case 'already-exists':
        return FirestoreFailure('The document already exists.');
      case 'cancelled':
        return FirestoreFailure('The operation was cancelled.');
      case 'data-loss':
        return FirestoreFailure(
          'Unrecoverable data loss or corruption occurred.',
        );
      case 'deadline-exceeded':
        return FirestoreFailure('The operation timed out.');
      case 'resource-exhausted':
        return FirestoreFailure('Resource exhausted. Try again later.');
      default:
        return FirestoreFailure('An unknown Firestore error occurred.');
    }
  }
}
