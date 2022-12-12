import 'package:http/http.dart' as http;
import 'dart:convert';

void updateTransaction(String user, int pk) async {
  var url =
      Uri.parse('https://bin-bank-pbp.up.railway.app/update-transaction-post/');
  Map<String, String> requestBody = <String, String>{
    'pk': pk.toString(),
    'user': user,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
}

void addTransaction(String username, int amountKg, String branchName) async {
  var url = Uri.parse(
      'https://bin-bank-pbp.up.railway.app/deposit_sampah/add_transaction_post/');
  Map<String, String> requestBody = <String, String>{
    "user": username,
    "amountKg": amountKg.toString(),
    "branchName": branchName,
  };

  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
  // TODO: handle return
  // return response;
}
