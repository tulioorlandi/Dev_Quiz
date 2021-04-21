import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/home_app_bar.dart';
import 'package:dev_quiz/home/widgets/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: HomeAppBar(
        user: "Tulio",
        title: "Vamos começar",
        text: "Complete os desafios e avance em conhecimento",
        value: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: LevelButtonWidget(label: "Fácil"),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: LevelButtonWidget(label: "Médio"),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: LevelButtonWidget(label: "Difícil"),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: LevelButtonWidget(label: "Perito"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    QuizCardWidget(
                      title: "Gerenciamento de Estado",
                      icon: AppImages.data,
                      step: 3,
                      total: 10,
                    ),
                    QuizCardWidget(
                      title: "Construindo Interfaces",
                      icon: AppImages.laptop,
                      step: 10,
                      total: 10,
                    ),
                    QuizCardWidget(
                      title: "Integração Nativa",
                      icon: AppImages.hierarchy,
                      step: 9,
                      total: 10,
                    ),
                    QuizCardWidget(
                      title: "Widgets do Flutter",
                      icon: AppImages.blocks,
                      step: 5,
                      total: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
