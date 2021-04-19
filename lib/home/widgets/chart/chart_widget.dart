import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 88,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 78,
              width: 78,
              child: CircularProgressIndicator(
                strokeWidth: 10.0,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                value: 0.0,
              ),
            ),
          ),
          Center(
            child: Text(
              "0%",
              style: AppTextStyles.heading,
            ),
          ),
        ],
      ),
    );
  }
}
