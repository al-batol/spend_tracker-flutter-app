class SignupModel {
  final String name;
  final String email;
  final String password;

  const SignupModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, String> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };
}
