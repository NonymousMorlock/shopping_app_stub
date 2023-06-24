import 'package:benaiah_okwukwe_anukem/core/theme/cubit/theme_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(ThemeCubit themeCubit)
      : _themeCubit = themeCubit,
        super(const SettingsState.initial());

  final ThemeCubit _themeCubit;

  Future<void> initialize() async {
    _themeCubit.stream.listen((themeState) {
      emit(
        themeState is DarkTheme
            ? state.copyWith(isDarkMode: true)
            : state.copyWith(isDarkMode: false),
      );
    });
  }

  Future<void> toggleTheme() async {
    if (state.isDarkMode) {
      await _themeCubit.getLightTheme();
      emit(state.copyWith(isDarkMode: false));
    } else {
      await _themeCubit.getDarkTheme();
      emit(state.copyWith(isDarkMode: true));
    }
  }
}
