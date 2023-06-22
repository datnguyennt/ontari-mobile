import 'package:intl/intl.dart';

import '../constant/number_format_constants.dart';
import '../constant/symbol_constants.dart';

class NumberFormatUtils {
  NumberFormatUtils._();

  static String formatYen(double price) {
    return NumberFormat.currency(symbol: SymbolConstants.yen, decimalDigits: 0)
        .format(price);
  }

  static String formatNumber(int number) {
    return NumberFormat(NumberFormatConstants.defaultFormat).format(number);
  }
}
