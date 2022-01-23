class LoginRequest {
  late String userName;
  late String password;

  LoginRequest({
    userName,
    password,
  });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['password'] = password;
    return data;
  }
}
