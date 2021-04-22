import "package:flutter/material.dart";

import '../../challenge/page/challenge_page.dart';
import "../../core/core.dart";
import "../controller/home_controller.dart";
import "../enum/home_state_enum.dart";
import '../widgets/avatar_widget.dart';
import "../widgets/level_button_widget.dart";
import "../widgets/quiz_card_widget.dart";
import '../widgets/score_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.fetchInicialData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(264),
          child: SizedBox(
            height: 264,
            child: Stack(
              children: [
                AvatarWidget(user: controller.user!),
                Align(
                  alignment: const Alignment(0, 1),
                  child: ScoreCardWidget(
                    value: controller.score,
                    title: "Vamos começar",
                    text: "Complete os desafios e avance em conhecimento",
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: LevelButtonWidget(label: "Fácil")),
                      const SizedBox(width: 4),
                      Expanded(child: LevelButtonWidget(label: "Médio")),
                      const SizedBox(width: 4),
                      Expanded(child: LevelButtonWidget(label: "Difícil")),
                      const SizedBox(width: 4),
                      Expanded(child: LevelButtonWidget(label: "Perito")),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: controller.quizzes!
                        .map(
                          (quiz) => QuizCardWidget(
                            quiz: quiz,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(
                                  questions: quiz.questions,
                                  questionsAnswered: quiz.questionsAnswered,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
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
          decoration: const BoxDecoration(gradient: AppGradients.linear),
          child: const Center(
            child: SizedBox(
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
