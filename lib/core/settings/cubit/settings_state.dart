part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.isDarkMode});

  const SettingsState.initial() : isDarkMode = false;
  final bool isDarkMode;

  SettingsState copyWith({
    bool? isDarkMode,
  }) =>
      SettingsState(isDarkMode: isDarkMode ?? this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];
}
