
import 'package:intl/intl.dart';

extension DoubleExt on double {
  String get decimalFormat => NumberFormat('#,##0.00').format(this);
}
