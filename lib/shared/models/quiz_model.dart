import "dart:convert";
import "package:dev_quiz/shared/models/question_model.dart";

enum Level {
  facil,
  medio,
  dificil,
  perito,
}

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModel {
  final String title;
  final String image;
  final Level level;
  final List<QuestionModel> questions;
  final int questionsAnswered;

  QuizModel({
    required this.title,
    required this.image,
    required this.level,
    required this.questions,
    this.questionsAnswered = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "image": image,
      "level": level.parse,
      "questions": questions.map((x) => x.toMap()).toList(),
      "questionsAnswered": questionsAnswered,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map["title"],
      image: map["image"],
      level: map["level"].toString().parse,
      questions: List<QuestionModel>.from(map["questions"].map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map["questionsAnswered"] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
