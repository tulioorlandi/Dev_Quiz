import "dart:convert";
import '../enums/level_enum.dart';
import "question_model.dart";

class QuizModel {
  QuizModel({
    required this.title,
    required this.image,
    required this.level,
    required this.questions,
    this.questionsAnswered = 0,
  });

  final String title;
  final String image;
  final Level level;
  final List<QuestionModel> questions;
  final int questionsAnswered;

  double get score => questionsAnswered / questions.length;

  factory QuizModel.fromMap(Map<String, dynamic> map) => QuizModel(
        title: map["title"],
        image: map["image"],
        level: map["level"].toString().parse,
        questions: List<QuestionModel>.from(
            map["questions"].map((x) => QuestionModel.fromMap(x))),
        questionsAnswered: map["questionsAnswered"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "image": image,
        "level": level.parse,
        "questions": questions.map((x) => x.toMap()).toList(),
        "questionsAnswered": questionsAnswered,
      };

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
