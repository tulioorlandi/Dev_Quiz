import 'dart:convert';

class AnswerModel {
  AnswerModel({
    required this.title,
    this.isRight = false,
  });

  final String title;
  final bool isRight;

  Map<String, dynamic> toMap() => {
        "title": title,
        "isRight": isRight,
      };

  factory AnswerModel.fromMap(Map<String, dynamic> map) => AnswerModel(
        title: map["title"],
        isRight: map["isRight"] ?? false,
      );

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}
