import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  const ScoreCardWidget({
    Key? key,
    required this.value,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;
  final double value;

  @override
  Widget build(BuildContext context) => Container(
        margin:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        padding: const EdgeInsets.all(24),
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ChartWidget(value: value),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.heading),
                    const SizedBox(height: 8),
                    Text(text, style: AppTextStyles.body),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
