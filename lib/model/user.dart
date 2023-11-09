class UserModel {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;
  final int uid;
  const UserModel({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
    required this.uid,
  });
}