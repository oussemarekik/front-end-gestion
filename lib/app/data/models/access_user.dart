class AccessUser {
  AccessUser({
    this.token,
  });

  final String? token;

  factory AccessUser.fromJson(Map<String, dynamic>? json) => AccessUser(
    token: json?["token"],
  );

  Map<String, dynamic> toJson() => {
    if(token != null)
      "token": token,
  };
}