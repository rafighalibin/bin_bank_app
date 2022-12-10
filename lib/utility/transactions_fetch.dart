import 'package:bin_bank_app/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bin_bank_app/model/transactions.dart';

Future<List<Transactions>> fetchTransactions() async {
  var url = Uri.parse(
      'https://raw.githubusercontent.com/kausarme/dummyjson/main/initial_wishlist_data.json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Transactions
  List<Transactions> list = [];
  for (var d in data) {
    if (d != null) {
      list.add(Transactions.fromJson(d));
    }
  }

  return list;
}
