import 'package:http/http.dart' as http;
import 'package:bin_bank_app/model/supportmessage.dart';
import 'dart:convert';

Future<List<Datum>> fetchSupportmessage() async {
  var url =
      Uri.parse('https://bin-bank-pbp.up.railway.app/json/support-message');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // melakukan konversi data json menjadi object Mywatchlist
  List<Datum> mySupportMessage = [];
  // print(data["data"]);
  int count = 1;
  for (var d in data["data"]) {
    if (d != null) {
      mySupportMessage.add(Datum.fromJson(d));
    }
    if (count == 5) {
      break;
    }
    count++;
  }
  return mySupportMessage;
}
