import "package:dev_quiz/core/app_text_styles.dart";
import "package:dev_quiz/core/core.dart";
import "package:dev_quiz/shared/widgets/linear_progress_indicator_widget.dart";
import "package:flutter/material.dart";

class QuestionIndicatorWidget extends StatelessWidget {
  final int questionNumber;
  final int total;

  const QuestionIndicatorWidget({
    Key? key,
    required this.questionNumber,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double value = questionNumber.toDouble() / total;
    String _question = questionNumber.toString().padLeft(2, "0");
    String _total = total.toString().padLeft(2, "0");

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questão $_question", style: AppTextStyles.body15),
              Text("de $_total", style: AppTextStyles.body15),
            ],
          ),
          SizedBox(height: 16.0),
          LinearProgressIndicatorWidget(value: value),
        ],
      ),
    );
  }
}
