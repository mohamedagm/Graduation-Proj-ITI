import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_project/features/auth/data/repo/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepoImpl) : super(AuthInitial());
  AuthRepoImpl authRepoImpl;
  registerEmailPasswordC(String email, String password) async {
    emit(AuthLoading());
    var result = await authRepoImpl.registerEmailPasswordR(email, password);
    result.fold(
      (failure) {
        emit(AuthFailure(failure.errMessage));
      },
      (user) {
        emit(AuthSuccess(user));
      },
    );
  }

  loginEmailPasswordC(String email, String password) async {
    emit(AuthLoading());
    var result = await authRepoImpl.loginEmailPasswordR(email, password);
    result.fold(
      (failure) {
        emit(AuthFailure(failure.errMessage));
      },
      (user) {
        emit(AuthSuccess(user));
      },
    );
  }

  signInWithGoogleC() async {
    emit(AuthLoading());
    var result = await authRepoImpl.signInWithGoogleR();
    result.fold(
      (failure) {
        emit(AuthFailure(failure.errMessage));
      },
      (user) {
        emit(AuthSuccess(user));
      },
    );
  }
}
