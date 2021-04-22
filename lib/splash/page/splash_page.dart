import "package:flutter/material.dart";

import "../../core/core.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2))
        .then((_) => Navigator.pushReplacementNamed(context, "/home"));
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
