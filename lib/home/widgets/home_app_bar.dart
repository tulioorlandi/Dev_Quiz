import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/score_card_widget.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends PreferredSize {
  final String user;
  final String title;
  final String text;
  final double value;

  HomeAppBar({
    this.user = "Fulano",
    required this.title,
    required this.text,
    required this.value,
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
                              text: user,
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
                          border: Border.all(
                            width: 1,
                            color: AppColors.purple,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://avatars.githubusercontent.com/u/8193915?s=400&u=7a6c4b81d61cdf85db45a0be8c19ca771792e282&v=4"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(
                    value: value,
                    title: title,
                    text: text,
                  ),
                ),
              ],
            ),
          ),
        );
}
