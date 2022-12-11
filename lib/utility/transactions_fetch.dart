import 'package:bin_bank_app/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bin_bank_app/model/transactions.dart';

Future<List<Transactions>> fetchTransactions() async {
  var url = Uri.parse('https://bin-bank-pbp.up.railway.app/json/');
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

Future<List<Transactions>> fetchTransactions1(String user) async {
  var url = Uri.parse('https://bin-bank-pbp.up.railway.app/json/post/');
  Map<String, String> requestBody = <String, String>{
    'user': user,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
  List<Transactions> list = [];
  for (var d in encoded) {
    if (d != null) {
      list.add(Transactions.fromJson(d));
    }
  }
  return list;
}

Future<List<Transactions>> fetchTransactionsRange(
    String user, int min, int max) async {
  var url = Uri.parse('https://bin-bank-pbp.up.railway.app/json/post/range');
  Map<String, String> requestBody = <String, String>{
    'Min': min.toString(),
    'Max': max.toString(),
    'user': user,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
  List<Transactions> list = [];
  for (var d in encoded) {
    if (d != null) {
      list.add(Transactions.fromJson(d));
    }
  }
  return list;
}

Future<List<Transactions>> fetchTransactionsBranch(
    String user, String branchName) async {
  var url = Uri.parse('https://bin-bank-pbp.up.railway.app/json/post/branch');
  Map<String, String> requestBody = <String, String>{
    'branchName': branchName,
    'user': user,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
  List<Transactions> list = [];
  for (var d in encoded) {
    if (d != null) {
      list.add(Transactions.fromJson(d));
    }
  }
  return list;
}

Future<List<Transactions>> fetchTransactionsSucces(String user) async {
  var url = Uri.parse('https://bin-bank-pbp.up.railway.app/json/post/success');
  Map<String, String> requestBody = <String, String>{
    'user': user,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
  List<Transactions> list = [];
  for (var d in encoded) {
    if (d != null) {
      list.add(Transactions.fromJson(d));
    }
  }
  return list;
}

Future<List<Transactions>> fetchTransactionsOngoing(String user) async {
  var url = Uri.parse('https://bin-bank-pbp.up.railway.app/json/post/ongoing');
  Map<String, String> requestBody = <String, String>{
    'user': user,
  };
  var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var encoded = json.decode(respStr);
  List<Transactions> list = [];
  for (var d in encoded) {
    if (d != null) {
      list.add(Transactions.fromJson(d));
    }
  }
  return list;
}
