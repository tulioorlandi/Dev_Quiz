import "package:dev_quiz/core/core.dart";
import "package:dev_quiz/home/state/home_state.dart";
import "package:flutter/material.dart";

import "../controller/home_controller.dart";
import "../widgets/home_app_bar.dart";
import "../widgets/level_button_widget.dart";
import "../widgets/quiz_card_widget.dart";

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: HomeAppBar(
          user: controller.user!,
          title: "Vamos começar",
          text: "Complete os desafios e avance em conhecimento",
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
                    children: controller.quizzes!.map((quiz) => QuizCardWidget(quiz: quiz)).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.linear,
          ),
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(strokeWidth: 30),
            ),
          ),
        ),
      );
    }
  }
}
