import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../shared/models/user_model.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) => Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: 56,
        ),
        decoration: const BoxDecoration(gradient: AppGradients.linear),
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
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.purple),
                image: DecorationImage(
                  image: NetworkImage(user.photoUrl),
                ),
              ),
            ),
          ],
        ),
      );
}
