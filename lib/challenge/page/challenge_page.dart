import "package:flutter/material.dart";

import '../../core/core.dart';
import '../../shared/models/question_model.dart';
import '../../shared/widgets/next_button_widget.dart';
import '../controller/challenge_controller.dart';
import "../widgets/question_indicator_widget.dart";
import '../widgets/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({
    Key? key,
    required this.questions,
    required this.questionsAnswered,
  }) : super(key: key);

  final List<QuestionModel> questions;
  final int questionsAnswered;

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(
        () => controller.currentPage = pageController.page!.toInt() + 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                      questionNumber: value,
                      questionsAnswered: widget.questionsAnswered,
                      total: widget.questions.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.questions
              .map((question) => QuizWidget(question: question))
              .toList(),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: NextButtonWidget.confirmar(
              label: "Confirmar",
              onTap: () {},
            ),
          ),
        ),
      );
}
