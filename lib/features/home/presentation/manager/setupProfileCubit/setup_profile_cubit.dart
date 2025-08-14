import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:iti_project/core/errors/firestore_exceptions.dart';
import 'package:iti_project/core/services/firestore_service.dart';
import 'package:iti_project/features/home/data/models/user_model.dart/user_model.dart';

part 'setup_profile_state.dart';

class SetupProfileCubit extends Cubit<SetupProfileState> {
  SetupProfileCubit(this.firestoreService) : super(SetupProfileInitial());
  final FirestoreService firestoreService;
  saveUserDataC(UserModel usermodel) async {
    emit(SetupProfileLoading());
    try {
      await firestoreService.saveUserData(usermodel: usermodel);
      emit(SetupProfileSuccess(user: null));
    } on FirebaseException catch (e) {
      emit(SetupProfileFailure(FirestoreFailure.fromCode(e.code).errMessage));
    } catch (e) {
      emit(SetupProfileFailure(e.toString()));
    }
  }

  getUserDataC(String uid) async {
    emit(SetupProfileLoading());
    try {
      var user = await firestoreService.getUserData(uid);
      emit(SetupProfileSuccess(user: user));
    } on FirebaseException catch (e) {
      emit(SetupProfileFailure(FirestoreFailure.fromCode(e.code).errMessage));
    } catch (e) {
      emit(SetupProfileFailure(e.toString()));
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
      emit(SetupProfileFailure('errrrrrrrrrrrrrrrrrrror :${e.toString()}'));
      return 'null';
    }
  }
}
