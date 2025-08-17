part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isLight;
  const ThemeState(this.isLight);

  @override
  List<Object?> get props => [isLight];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.isLight);
}
