part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  Color get backgroundColour;

  Color get accentColour;

  Color get inactiveColour;

  MaterialColor get primarySwatch;

  @override
  List<Object?> get props => [
        backgroundColour,
        accentColour,
      ];
}

class DarkTheme extends ThemeState {
  const DarkTheme();

  @override
  Color get backgroundColour => const Color(0xFF181a20);

  @override
  Color get accentColour => const Color(0xFFFFFFFF);

  @override
  Color get inactiveColour => const Color(0xFF393939);

  @override
  MaterialColor get primarySwatch => Colors.blueGrey;
}

class LightTheme extends ThemeState {
  const LightTheme();

  @override
  Color get backgroundColour => const Color(0xFFFFFFFF);

  @override
  Color get accentColour => const Color(0xFF0F0F0F);

  @override
  Color get inactiveColour => const Color(0xFF393939);

  @override
  MaterialColor get primarySwatch => Colors.blue;
}
