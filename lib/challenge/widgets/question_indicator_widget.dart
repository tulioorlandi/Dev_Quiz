import "package:flutter/material.dart";

import "../../core/app_text_styles.dart";
import "../../core/core.dart";
import "../../shared/widgets/linear_progress_indicator_widget.dart";

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({
    Key? key,
    required this.questionNumber,
    required this.questionsAnswered,
    required this.total,
  }) : super(key: key);

  final int questionNumber;
  final int questionsAnswered;
  final int total;

  @override
  Widget build(BuildContext context) {
    final value = questionsAnswered / total;
    final _question = (questionNumber).toString().padLeft(2, "0");
    final _total = total.toString().padLeft(2, "0");

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Questão $_question", style: AppTextStyles.heading),
            Text("de $_total", style: AppTextStyles.body),
          ],
        ),
        const SizedBox(height: 16),
        LinearProgressIndicatorWidget(value: value),
      ],
    );
  }
}
