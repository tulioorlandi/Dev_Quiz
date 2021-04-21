import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/score_card_widget.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends PreferredSize {
  final UserModel user;
  final String title;
  final String text;

  HomeAppBar({
    required this.user,
    required this.title,
    required this.text,
  }) : super(
          preferredSize: Size.fromHeight(264),
          child: Container(
            height: 264,
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                    vertical: 56.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: AppColors.purple),
                          image: DecorationImage(
                            image: NetworkImage(user.photoUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(
                    value: user.score.toDouble(),
                    title: title,
                    text: text,
                  ),
                ),
              ],
            ),
          ),
        );
}
