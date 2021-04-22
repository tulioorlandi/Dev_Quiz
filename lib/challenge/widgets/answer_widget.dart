import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../shared/models/answer_model.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final AnswerModel answer;
  final bool isSelected;
  final VoidCallback onTap;

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: isSelected ? _selectedBorderCardRight : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  answer.title,
                  style:
                      isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                ),
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: isSelected ? _selectedColorRight : AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? _selectedBorderRight : AppColors.border,
                  ),
                ),
                child: isSelected
                    ? Icon(_selectedIconRight, color: AppColors.white, size: 16)
                    : null,
              ),
            ],
          ),
        ),
      );
}
