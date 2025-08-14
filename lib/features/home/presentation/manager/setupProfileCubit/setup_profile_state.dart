part of 'setup_profile_cubit.dart';

sealed class SetupProfileState extends Equatable {
  const SetupProfileState();

  @override
  List<Object> get props => [];
}

final class SetupProfileInitial extends SetupProfileState {}

final class SetupProfileLoading extends SetupProfileState {}

final class SetupProfileSuccess extends SetupProfileState {
  final UserModel? user;
  const SetupProfileSuccess({this.user});
}

final class SetupProfileFailure extends SetupProfileState {
  final String errMsg;

  const SetupProfileFailure(this.errMsg);
}
