import "package:flutter/material.dart";

import "../../shared/models/quiz_model.dart";
import "../../shared/models/user_model.dart";
import '../enum/home_state_enum.dart';
import '../repository/home_repository.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;
  double score = 0;

  final repository = HomeRepository();

  Future<void> getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  Future<void> getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }

  Future<void> fetchInicialData() async {
    state = HomeState.loading;
    user = await repository.getUser();
    quizzes = await repository.getQuizzes();
    if (quizzes != null) {
      score = 0;
      quizzes!.forEach((quiz) => score += quiz.score);
      score /= quizzes!.length;
    }
    state = HomeState.success;
  }
}
