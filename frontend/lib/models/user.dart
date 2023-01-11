class User {
  int userId;
  String username;
  String token;

  User({required this.userId, required this.username, required this.token});

  factory User.fromJson(Map<String, dynamic> json) => User(
      userId: json["userId"] as int,
      username: json["username"].toString(),
      token: json["token"].toString()
      );
}
