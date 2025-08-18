import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:iti_project/core/errors/firestore_exceptions.dart';
import 'package:iti_project/core/services/firestore_service.dart';
import 'package:iti_project/features/profile/data/model/user_model.dart/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.firestoreService) : super(ProfileInitial());
  final FirestoreService firestoreService;

  saveUserDataC(UserModel usermodel) async {
    emit(ProfileLoading());
    try {
      await firestoreService.saveUserData(usermodel: usermodel);
      emit(ProfileSuccess(user: usermodel));
    } on FirebaseException catch (e) {
      emit(ProfileFailure(FirestoreFailure.fromCode(e.code).errMessage));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }

  getUserDataC(String uid) async {
    emit(ProfileLoading());
    try {
      var user = await firestoreService.getUserData(uid);
      emit(ProfileSuccess(user: user));
    } on FirebaseException catch (e) {
      emit(ProfileFailure(FirestoreFailure.fromCode(e.code).errMessage));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }

  Future<String> uploadProfileImage(File imageFile, String uid) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(
        'users/$uid/profile.jpg',
      );
      await ref.putFile(imageFile);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } on Exception catch (e) {
      emit(ProfileFailure('errrrrrrrrrrrrrrrrrrror :${e.toString()}'));
      return 'null';
    }
  }
}
