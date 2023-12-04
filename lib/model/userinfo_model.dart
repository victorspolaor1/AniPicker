class User {
  final int id;
  final String name;
  final String email;
  final String about;
  final String token;
  final bool isDarkMode;

  const User({
    required this.id,
    required this.name, 
    required this.email, 
    required this.about,
    required this.token,
    required this.isDarkMode
  });

  factory User.fromJson(Map<String,dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      about: json['about'] as String,
      token: json['token'] as String,
      isDarkMode: json['isDarkMode'] as bool,
    );
  }
}