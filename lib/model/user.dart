// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

List<UserProfile> userProfileFromJson(String str) => List<UserProfile>.from(
    json.decode(str).map((x) => UserProfile.fromJson(x)));

String userProfileToJson(List<UserProfile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserProfile {
  UserProfile({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };

  String get username => fields.user.username;
  int get poin => fields.poin;
}

class Fields {
  Fields({
    required this.user,
    required this.poin,
  });

  User user;
  int poin;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: User.fromJson(json["user"]),
        poin: json["poin"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "poin": poin,
      };
}

class User {
  User({
    required this.id,
    required this.isSuperuser,
    required this.username,
  });

  int id;
  bool isSuperuser;
  String username;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        isSuperuser: json["is_superuser"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_superuser": isSuperuser,
        "username": username,
      };
}
