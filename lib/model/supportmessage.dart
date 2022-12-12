// To parse this JSON data, do
//
//     final supportmessage = supportmessageFromJson(jsonString);

import 'dart:convert';

Supportmessage supportmessageFromJson(String str) =>
    Supportmessage.fromJson(json.decode(str));

String supportmessageToJson(Supportmessage data) => json.encode(data.toJson());

class Supportmessage {
  Supportmessage({
    required this.data,
  });

  List<Datum> data;

  factory Supportmessage.fromJson(Map<String, dynamic> json) => Supportmessage(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.username,
    required this.date,
    required this.message,
  });

  String username;
  DateTime date;
  String message;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        username: json["username"],
        date: DateTime.parse(json["date"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "message": message,
      };
}
