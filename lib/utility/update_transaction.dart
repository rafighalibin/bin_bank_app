import 'dart:ffi';

import 'package:bin_bank_app/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bin_bank_app/model/transactions.dart';

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
