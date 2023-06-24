import 'dart:ui';

extension StringExt on String {
  String get obscureEmail {
    // Split the email into username and domain
    final index = indexOf('@');
    var username = substring(0, index);
    final domain = substring(index + 1);
    // Obscure the username and display only the first and last characters
    username = '${username[0]}****${username[username.length - 1]}';
    // Return the obscured email
    return '$username@$domain';
  }

  Color get toColour {
    final colorValues = split('-');
    final alpha = int.parse(colorValues[0]);
    final red = int.parse(colorValues[1]);
    final green = int.parse(colorValues[2]);
    final blue = int.parse(colorValues[3]);
    return Color.fromARGB(alpha, red, green, blue);
  }

  String get capitalize {
    if (trim().isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get titleCase {
    if (trim().isEmpty) return this;
    return split(' ').map<String>((e) => e.capitalize).toList().join(' ');
  }
}
