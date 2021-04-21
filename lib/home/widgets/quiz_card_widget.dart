import "package:dev_quiz/core/core.dart";
import "package:dev_quiz/shared/models/quiz_model.dart";
import "package:dev_quiz/shared/widgets/linear_progress_indicator_widget.dart";
import "package:flutter/material.dart";

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;

  const QuizCardWidget({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double value = quiz.questionsAnswered.toDouble() / quiz.questions.length;
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(quiz.image),
          ),
          Text(
            quiz.title,
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  "${quiz.questionsAnswered} de ${quiz.questions.length}",
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 7,
                child: LinearProgressIndicatorWidget(value: value),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
