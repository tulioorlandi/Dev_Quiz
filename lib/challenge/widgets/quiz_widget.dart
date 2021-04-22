import "package:flutter/material.dart";

import '../../core/app_text_styles.dart';
import '../../shared/models/answer_model.dart';
import '../../shared/models/question_model.dart';
import 'answer_widget.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  final QuestionModel question;

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AnswerModel answers(int index) => widget.question.answers[index];

  void selectAnswer(int index) {
    indexSelected = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.question.title, style: AppTextStyles.heading20),
            const SizedBox(height: 24),
            for (var i = 0; i < widget.question.answers.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: AnswerWidget(
                  answer: answers(i),
                  isSelected: indexSelected == i,
                  onTap: () => selectAnswer(i),
                ),
              ),
          ],
        ),
      );
}
