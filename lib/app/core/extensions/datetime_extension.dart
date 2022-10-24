extension DateTimeExtension on DateTime {
  String toFormattedFullString() {
    return '$day/$month/$year - $hour:$minute';
  }

  String toFormattedString() {
    return '$day/$month/$year';
  }
}
