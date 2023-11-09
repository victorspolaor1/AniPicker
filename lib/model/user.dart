class UserModel {
  final String? imagePath;
  final String? name;
  final String? email;
  final String? about;
  final bool? isDarkMode;
  final String uid;
  const UserModel({
     this.imagePath,
     this.name,
     this.email,
     this.about,
     this.isDarkMode,
     required this.uid,
  });
}