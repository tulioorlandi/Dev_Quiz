import "package:flutter/material.dart";

import "../../core/core.dart";

class LinearProgressIndicatorWidget extends StatelessWidget {
  const LinearProgressIndicatorWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) => LinearProgressIndicator(
        backgroundColor: AppColors.chartSecondary,
        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
        value: value,
      );
}
