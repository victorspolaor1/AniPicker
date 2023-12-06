class User {
  final int id;
  final String name;
  final String email;
  final String about;

  const User({
    required this.id,
    required this.name, 
    required this.email, 
    required this.about,
  });

  factory User.fromJson(Map<String,dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      about: json['about'] as String,
    );
  }
}