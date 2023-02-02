import 'package:intl/intl.dart';

/// It's a function that formats a double value to a real currency
String formatToReal(double value) {
  final formatter = NumberFormat.currency(locale: 'pt_BR', decimalDigits: 2, symbol: 'R\$');
  return formatter.format(value);
} 