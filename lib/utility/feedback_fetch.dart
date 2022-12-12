import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bin_bank_app/model/feedback.dart';

Future<List<Feedback>> fetchFeedback() async {
  var url = Uri.parse('http://127.0.0.1:8000/feedback-json');
  var response = await http.get(
    url,
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Feedback
  List<Feedback> listFeedback = [];
  for (var d in data) {
    if (d != null) {
      listFeedback.add(Feedback.fromJson(d));
    }
  }

  return listFeedback;
}
