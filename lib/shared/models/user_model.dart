import "dart:convert";

class UserModel {
  UserModel({
    required this.name,
    required this.photoUrl,
    this.score = 0,
  });

  final String name;
  final String photoUrl;
  final double score;

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoUrl": photoUrl,
        "score": score,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        name: map["name"],
        photoUrl: map["photoUrl"],
        score: map["score"] ?? 0,
      );

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
