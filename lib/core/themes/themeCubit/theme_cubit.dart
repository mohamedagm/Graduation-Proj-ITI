import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(true));

  void toggleTheme() {
    emit(ThemeInitial(!state.isLight));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeInitial(json['isLight'] as bool);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'isLight': state.isLight};
  }
}
