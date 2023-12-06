import 'package:anipicker/model/userinfo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  //Hard-coded user
  static  User myUser = User(
    id: 1,
    name: 'User',
    email: 'user_example@gmail.com',
    about:
        'Back-end developer with years of experience in watching anime and judging the quality of it by the first episode, not always on point, but always correct',
  );

  Future<bool> saveUser (User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', user.id);
    prefs.setString('name', user.name);
    prefs.setString('email', user.email);
    prefs.setString('about', user.about);
  
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int id = prefs.getInt("id")!;
    String name = prefs.getString('name')!;
    String email = prefs.getString('email')!;
    String about = prefs.getString('about')!;

    return User(
      id: id,
      name: name,
      email: email,
      about: about,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("id");
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('about');

  }
}