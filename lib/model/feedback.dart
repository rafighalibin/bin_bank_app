// To parse this JSON data, do
//
//     final feedback = feedbackFromJson(jsonString);

import 'dart:convert';

List<Feedback> feedbackFromJson(String str) =>
    List<Feedback>.from(json.decode(str).map((x) => Feedback.fromJson(x)));

String feedbackToJson(List<Feedback> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Feedback {
  Feedback({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
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
    required this.subject,
    required this.feedback,
  });

  int user;
  DateTime date;
  String subject;
  String feedback;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        subject: json["subject"],
        feedback: json["feedback"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "subject": subject,
        "feedback": feedback,
      };
}
