import 'package:http/http.dart' as http;
import 'package:bin_bank_app/model/leaderboard_model.dart';
import 'dart:convert';
// import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<List<Fields>> fetchLeaderboard() async {
  print("stage 1");
  var url = Uri.parse('https://bin-bank-pbp.up.railway.app/json/leaderboard');
  print("stage 2");
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );
  print("stage 3");
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // melakukan konversi data json menjadi object Mywatchlist
  print("stage 4");
  List<Fields> myLeaderboard = [];
  // print(data["data"]);
  print(data);
  print("\n\n");
  for (var d in data) {
    print(d);
    if (d != null) {
      print("STAGEE");
      myLeaderboard.add(Fields.fromJson(d["fields"]));
    }
    print("STAGE2");
  }
  print("stage 5");
  return myLeaderboard;
}
