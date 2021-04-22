import 'package:flutter/material.dart';

import '../../core/core.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 88,
        width: 88,
        child: Stack(
          children: [
            const Center(
              child: SizedBox(
                height: 88,
                width: 88,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  value: 0,
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
