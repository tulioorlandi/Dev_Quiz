import "dart:convert";
import "answer_model.dart";

class QuestionModel {
  QuestionModel({
    required this.title,
    required this.answers,
  }) : assert(answers.length == 4);

  final String title;
  final List<AnswerModel> answers;

  Map<String, dynamic> toMap() => {
        "title": title,
        "answers": answers.map((x) => x.toMap()).toList(),
      };

  factory QuestionModel.fromMap(Map<String, dynamic> map) => QuestionModel(
        title: map["title"],
        answers: List<AnswerModel>.from(
            map["answers"].map((x) => AnswerModel.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
