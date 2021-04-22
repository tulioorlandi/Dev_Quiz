import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../shared/widgets/next_button_widget.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({
    Key? key,
    required this.rightAnswer,
    required this.isRight,
  }) : super(key: key);

  final String rightAnswer;
  final bool isRight;

  String get feedbackImage => isRight ? AppImages.check : AppImages.error;
  String get feedbackText => isRight ? "Acertou!" : "Errou :/";

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  feedbackImage,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 40),
                Text(
                  feedbackText,
                  style: AppTextStyles.heading30,
                ),
                const SizedBox(height: 16),
                Text(
                  rightAnswer,
                  style: AppTextStyles.body15,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: NextButtonWidget.avancar(
                        label: "Avançar",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
