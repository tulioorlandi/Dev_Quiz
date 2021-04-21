import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String icon;
  final int step;
  final int total;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.step,
    required this.total,
  }) : super(key: key);

  double get value => step.toDouble() / total;

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(icon),
          ),
          Text(
            title,
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  "$step de $total",
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 7,
                child: LinearProgressIndicatorWidget(
                  value: value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
