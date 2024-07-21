import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  static final _dateFormat = DateFormat('yyyy/MM/dd');
  static final _dateFormatDayMonthYear = DateFormat('dd/MM/yyyy');
  static final _dateFormatMonthYear = DateFormat('MM/yyyy');

  String asDate() => _dateFormat.format(this);

  String asBrazilDate() => _dateFormatDayMonthYear.format(this);

  String asMonthYear() => _dateFormatMonthYear.format(this);
}
