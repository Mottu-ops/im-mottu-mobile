extension ExtensionFormatterString on String {
  String toPhoneNumberFormatted() {
    if (length != 11) return this;

    final String ddd = substring(0, 2);
    return '($ddd) ${this[2]} ${substring(3, 7)}-${substring(7)}';
  }

  String toDateTimeString() {
    final List<String> date = split('/');
    if (date[1].length == 1) {
      date[1] = '0${date[1]}';
    }
    if (date[0].length == 1) {
      date[0] = '0${date[0]}';
    }

    return '${date[2]}-${date[1]}-${date[0]}';
  }
}
