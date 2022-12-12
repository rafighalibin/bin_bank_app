import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> sendSupportMessage(
    String username, String message) async {
  var url = Uri.parse(
      'https://bin-bank-pbp.up.railway.app/leaderboard/add-support-message-app');
  var response = await http.post(url, headers: <String, String>{
    // 'Content-Type': 'application/json; charset=UTF-8',
  }, body: {
    "user": username,
    "message": message,
  });
  return response;
}
