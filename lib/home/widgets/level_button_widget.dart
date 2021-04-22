import "package:flutter/material.dart";

import "../../core/core.dart";

class LevelButtonWidget extends StatelessWidget {
  LevelButtonWidget({Key? key, required this.label})
      : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)),
        super(key: key);

  final String label;

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil,
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio,
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil,
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito,
    },
  };

  Color get color => config[label]!["color"]!;
  Color get fontColor => config[label]!["fontColor"]!;
  Color get borderColor => config[label]!["borderColor"]!;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.body.copyWith(color: fontColor),
          ),
        ),
      );
}
