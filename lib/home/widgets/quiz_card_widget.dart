import "package:flutter/material.dart";

import "../../core/core.dart";
import "../../shared/models/quiz_model.dart";
import "../../shared/widgets/linear_progress_indicator_widget.dart";

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({
    Key? key,
    required this.quiz,
    required this.onTap,
  }) : super(key: key);

  final QuizModel quiz;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final value = quiz.questionsAnswered / quiz.questions.length;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(quiz.image),
            ),
            Text(quiz.title, style: AppTextStyles.heading15),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                      "${quiz.questionsAnswered} de ${quiz.questions.length}",
                      style: AppTextStyles.body11),
                ),
                Expanded(
                    flex: 7,
                    child: LinearProgressIndicatorWidget(value: value)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
