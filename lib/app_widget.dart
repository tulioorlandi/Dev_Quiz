import "package:flutter/material.dart";

import "home/page/home_page.dart";
import "splash/page/splash_page.dart";

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "DevQuiz",
        initialRoute: "/",
        routes: {
          "/": (_) => const SplashPage(),
          "/home": (_) => const HomePage(),
          //"/score": () => ScorePage(),
        },
      );
}
