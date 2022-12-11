// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

List<Transactions> transactionsFromJson(String str) => List<Transactions>.from(json.decode(str).map((x) => Transactions.fromJson(x)));

String transactionsToJson(List<Transactions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transactions {
  Transactions({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.user,
    required this.date,
    required this.amountKg,
    required this.branchName,
    required this.isFinished,
  });

  int user;
  DateTime date;
  int amountKg;
  String branchName;
  bool isFinished;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    date: DateTime.parse(json["date"]),
    amountKg: json["amountKg"],
    branchName: json["branchName"],
    isFinished: json["isFinished"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "date": date.toIso8601String(),
    "amountKg": amountKg,
    "branchName": branchName,
    "isFinished": isFinished,
  };
}
