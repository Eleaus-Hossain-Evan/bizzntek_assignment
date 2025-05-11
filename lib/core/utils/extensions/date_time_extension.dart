part of 'extensions.dart';

extension DurationX on int {
  Duration get inDuration => Duration(seconds: this);
}

extension XDateTimeExtension on DateTime {
  String get dayOfWeek => DateFormat('EEE').format(this);
  String get dayOfMonth => DateFormat('dd').format(this);
  String get fullMonthName => DateFormat('MMMM').format(this);
  String get year => DateFormat('y').format(this);

  String formatToWord({String? pattern, String locale = 'en'}) {
    return pattern == null ? DateFormat.yMMMMd().format(this) : DateFormat(pattern, locale).format(this);
  }

  String formatToWordWithTime() {
    return "${DateFormat("d MMM y").format(this)}, ${DateFormat.jm().format(this)}";
  }

  String toFormatDate([String pattern = 'dd/MM/yyyy', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String toFormatTime([String pattern = 'h:mm a', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String toFormatDividerDate([String pattern = 'dd-MM-yyyy', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

extension XDateString on String {
  DateTime? toDate() {
    try {
      final DateTime? st = DateTime.tryParse(this);
      return st;
      // ignore: unused_catch_clause
    } on FormatException catch (e) {
      return null;
    }
  }
}
