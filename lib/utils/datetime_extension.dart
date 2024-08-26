import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  String formatDate() {
    return DateFormat('dd-MM-yyyy HH:mm:ss').format(this);
  }

  String formatDateForFile() {
    return DateFormat('dd_MM_yyyy HH_mm_ss').format(this);
  }
}

extension FormatUnix on int {
  String formatDateUnix() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    final formatter = DateFormat('EEEE dd MMMM yyyy, HH:mm:ss');
    return formatter.format(dateTime);
  }
}
