enum Level {
  easy,
  medium,
  hard,
  expert,
}

extension LevelStringExt on String {
  Level get parse => {
        "easy": Level.easy,
        "medium": Level.medium,
        "hard": Level.hard,
        "expert": Level.expert,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.easy: "easy",
        Level.medium: "medium",
        Level.hard: "hard",
        Level.expert: "expert",
      }[this]!;
}
