import 'package:intl/intl.dart';

String readTimestamp(int timestamp) {
  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMicrosecondsSinceEpoch(timestamp);
  // var diff = date.difference(now);
  // var time = '';

  // print('cekk time ${diff.inDays}');

  // if (diff.inSeconds <= 0 ||
  //     diff.inSeconds > 0 && diff.inMinutes == 0 ||
  //     diff.inMinutes > 0 && diff.inHours == 0 ||
  //     diff.inHours > 0 && diff.inDays == 0) {
  //   time = format.format(date);
  //   print("cekk ini ke if awal");
  // } else {
  //   print("cekk ini ke if else");
  //   if (diff.inDays == 1) {
  //     time = '${diff.inDays}DAY AGO';
  //   } else {
  //     time = '${diff.inDays}DAYS AGO';
  //   }
  // }

  // print('cekk time = 1 $time');

  // return time;
  Duration diff = DateTime.now().difference(date);

  print('cekk diff -----> ${(diff.inDays / 7).floor()}');

  if (diff.inDays > 365) {
    return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "tahun" : "tahun"} lalu";
  }
  if (diff.inDays > 30) {
    return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "bulan" : "bulan"} lalu";
  }
  if (diff.inDays > 7) {
    return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "minggu" : "minggu"} lalu";
  }
  if (diff.inDays > 0) {
    return "${diff.inDays} ${diff.inDays == 1 ? "hari" : "hari"} lalu";
  }
  if (diff.inHours > 0) {
    return "${diff.inHours} ${diff.inHours == 1 ? "jam" : "jam"} lalu";
  }
  if (diff.inMinutes > 0) {
    return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} lalu";
  }
  return "just now";
}
