import 'package:http/http.dart' as http;
import 'package:bin_bank_app/model/leaderboard_model.dart';
import 'dart:convert';

Future<List<Fields>> fetchLeaderboard() async {
  var url = Uri.parse('https://bin-bank-pbp.up.railway.app/json/leaderboard');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Fields> myLeaderboard = [];
  for (var d in data) {
    if (d != null) {
      myLeaderboard.add(Fields.fromJson(d["fields"]));
    }
  }
  return myLeaderboard;
}
