
import 'dart:ui';

extension ColorExt on Color {
  // Convert color to hex string
  String get toARGB {
    final alpha = this.alpha;
    final red = this.red;
    final green = this.green;
    final blue = this.blue;
    return '$alpha-$red-$green-$blue';
  }
}
