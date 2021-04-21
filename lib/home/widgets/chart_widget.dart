import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final double value;

  const ChartWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 88,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 88,
              width: 88,
              child: CircularProgressIndicator(
                strokeWidth: 10.0,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                value: 0.0,
              ),
            ),
          ),
          Center(
            child: Text("${value.round()}%", style: AppTextStyles.heading),
          ),
        ],
      ),
    );
  }
}
