import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iti_project/features/home/data/models/user_model.dart/user_model.dart';

class FirestoreService {
  final FirebaseFirestore firestore;
  const FirestoreService(this.firestore);

  Future<void> saveUserData({required UserModel usermodel}) async {
    await firestore
        .collection('users')
        .doc(usermodel.uid)
        .set(usermodel.toMap());
  }

  Future<UserModel> getUserData(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();
    return UserModel.fromMap(doc.data()!);
  }
}
