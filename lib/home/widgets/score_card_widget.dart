import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final String title;
  final String text;
  final double value;

  const ScoreCardWidget({
    Key? key,
    required this.value,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      padding: const EdgeInsets.all(24.0),
      height: 136,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          ChartWidget(value: value),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.heading,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    text,
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
