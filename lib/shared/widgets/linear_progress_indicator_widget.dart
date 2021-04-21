import "package:dev_quiz/core/core.dart";
import "package:flutter/material.dart";

class LinearProgressIndicatorWidget extends StatelessWidget {
  final double value;

  const LinearProgressIndicatorWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
      value: value,
    );
  }
}
