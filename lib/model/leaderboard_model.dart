// To parse this JSON data, do
//
//     final leaderboard = leaderboardFromJson(jsonString);

import 'dart:convert';

List<Leaderboard> leaderboardFromJson(String str) => List<Leaderboard>.from(
    json.decode(str).map((x) => Leaderboard.fromJson(x)));

String leaderboardToJson(List<Leaderboard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Leaderboard {
  Leaderboard({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
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
    required this.password,
    required this.lastLogin,
    required this.username,
    required this.points,
    required this.isAdmin,
  });

  String password;
  DateTime? lastLogin;
  String username;
  int points;
  bool isAdmin;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        password: json["password"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]!),
        username: json["username"],
        points: json["points"],
        isAdmin: json["is_admin"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "last_login": lastLogin == null ? null : lastLogin!.toIso8601String(),
        "username": username,
        "points": points,
        "is_admin": isAdmin,
      };
}
