import 'package:flutter/material.dart';

import '../../core/core.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.textStyle,
    required this.backgroundColor,
    this.borderColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.confirmar({required this.label, required this.onTap})
      : textStyle = AppTextStyles.nextButtonConfirmar,
        backgroundColor = AppColors.darkGreen,
        borderColor = null;

  NextButtonWidget.avancar({required this.label, required this.onTap})
      : textStyle = AppTextStyles.nextButtonAvancar,
        backgroundColor = AppColors.purple,
        borderColor = null;

  final String label;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color? borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 14)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          side: MaterialStateProperty.all(
            borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
          ),
        ),
        child: Text(label, style: textStyle),
      );
}
