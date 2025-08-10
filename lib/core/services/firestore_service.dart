// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   Future<void> saveUserData({
//     required String uid,
//     required String phone,
//     required String email,
//     required String name,
//     required String date,
//     required String gender,
//     required String location,
//     required String imageLink,
//   }) async {
//     await firestore.collection('users').doc(uid).set({
//       'uid': uid,
//       'phone': phone,
//       'email': email,
//       'name': name,
//       'date': date,
//       'gender': gender,
//       'location': location,
//       'imageLink': imageLink,
//     }, SetOptions(merge: true));
//   }

//   Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) {
//     return firestore.collection('users').doc(uid).get();
//   }
// }
