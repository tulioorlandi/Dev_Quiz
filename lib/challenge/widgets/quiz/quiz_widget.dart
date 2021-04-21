import 'package:dev_quiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading20,
          ),
          SizedBox(height: 24),
          Column(
            children: [
              AwnserWidget(
                awnser: "Kit de desenvolvimento de interface de usuário",
                isSelected: true,
                isRight: true,
              ),
              SizedBox(height: 8),
              AwnserWidget(awnser: "Possibilita a criação de aplicativos compilados nativamente"),
              SizedBox(height: 8),
              AwnserWidget(awnser: "Acho que é uma marca de café do Himalaia"),
              SizedBox(height: 8),
              AwnserWidget(awnser: "Possibilita a criação de desktops que são muito incríveis"),
            ],
          ),
        ],
      ),
    );
  }
}
