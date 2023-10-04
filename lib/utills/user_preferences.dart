import 'package:anipicker/model/user.dart';

class UserPreferences {
  static const myUser = User(
    imagePath:
        'asset/images/profile.jpg',
    name: 'User',
    email: 'user_example@gmail.com',
    about:
        'Back-end developer with years of experience in watching anime and judging the quality of it by the first episode, not always on point, but always correct',
    isDarkMode: false,
  );
}