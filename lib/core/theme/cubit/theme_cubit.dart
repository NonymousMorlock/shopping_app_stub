import 'package:benaiah_okwukwe_anukem/core/services/cache_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  factory ThemeCubit(Future<bool> isDarkMode) {
    _instance ??= ThemeCubit._(isDarkMode);
    return _instance!;
  }

  ThemeCubit._(Future<bool> isDarkMode) : super(const LightTheme()) {
    initialize(isDarkMode);
  }

  static ThemeCubit? _instance;

  Future<void> initialize(Future<bool> isDarkMode) async {
    await isDarkMode.then(
      (isDark) => emit(isDark ? const DarkTheme() : const LightTheme()),
    );
  }

  Future<void> getDarkTheme() async {
    await CacheService.setTheme(isDark: true);
    emit(const DarkTheme());
  }

  Future<void> getLightTheme() async {
    await CacheService.setTheme(isDark: false);
    emit(const LightTheme());
  }
}
