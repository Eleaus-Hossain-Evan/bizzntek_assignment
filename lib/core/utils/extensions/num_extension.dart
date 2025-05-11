part of 'extensions.dart';

extension NumberConverter on num {
  static const Map<String, String> arabicDigits = <String, String>{
    '0': '\u0660',
    '1': '\u0661',
    '2': '\u0662',
    '3': '\u0663',
    '4': '\u0664',
    '5': '\u0665',
    '6': '\u0666',
    '7': '\u0667',
    '8': '\u0668',
    '9': '\u0669',
  };

  String toWeightString() {
    if (this < 1) {
      return '${(this * 1000).toStringAsFixed(0)} gm';
    } else {
      return '${toStringAsFixed(0)} kg';
    }
  }

  String toCurrency({String pattern = "#,##,##0", String locale = 'en'}) =>
      NumberFormat.currency(
              customPattern: pattern,
              decimalDigits: 0,
              locale: locale,
              symbol: locale == 'bn' ? '৳' : '\$')
          .format(this);

  String toBanglaDigits() {
    final String number = toString();
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < number.length; i++) {
      sb.write(banglaDigits[number[i]] ?? number[i]);
    }
    return sb.toString();
  }

  String formatCurrency(int amount,
      {String symbol = '৳', required Locale locale}) {
    final formatter = NumberFormat.currency(
      locale: locale.toString(), // Adjust locale as per your requirement
      symbol: symbol, // Currency symbol
    );
    return formatter.format(amount);
  }

  String get toFullString => switch (this) {
        1 => "First",
        2 => "Second",
        3 => "Third",
        4 => "Fourth",
        5 => "Fifth",
        6 => "Sixth",
        7 => "Seventh",
        8 => "Eighth",
        9 => "Ninth",
        _ => "Not Implemented"
      };
}
