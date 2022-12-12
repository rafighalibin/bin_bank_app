import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> sendSupportMessage(
    String username, String message) async {
  print("CALLED");
  var url =
      Uri.parse('http://127.0.0.1:8000/leaderboard/add-support-message-app');
  print("CALLED2");
  var response = await http.post(url, headers: <String, String>{
    // 'Content-Type': 'application/json; charset=UTF-8',
  }, body: {
    "user": username,
    "message": message,
  });
  return response;
}
