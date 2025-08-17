import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:iti_project/core/services/firebase_service.dart';
import 'package:iti_project/core/services/firestore_service.dart';
import 'package:iti_project/features/auth/data/repo/auth_repo_impl.dart';

final getIt = GetIt.instance;

class SetupService {
  void setupDI() {
    getIt.registerSingleton<FirebaseService>(
      FirebaseService(FirebaseAuth.instance),
    );
    getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(getIt.get<FirebaseService>()),
    );

    getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

    getIt.registerSingleton<FirestoreService>(
      FirestoreService(getIt.get<FirebaseFirestore>()),
    );
    getIt.registerSingleton<Dio>(Dio());
  }
}
