import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:anipicker/widget/appbar_widget.dart';
import 'package:anipicker/widget/numbers_widget.dart';
import 'package:anipicker/providers/user.dart';
import 'package:anipicker/global.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserProvider helper = UserProvider.helper;
  final user = TextEditingController();
  String? userName = "";
  String? userAbout = "";
  String? userEmail = "";

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    try {
      List userData = await helper.getUser(loggedInUser); // Replace '1' with the actual user ID
      if (userData.isNotEmpty) {
        setState(() {
          userName = userData[0]['username'];
          userAbout = userData[0]['about'];
          userEmail = userData[0]['email'];
        });
      }
    } catch (e) {
      print('Error fetching user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          buildName(),
          buildEmail(),
          const SizedBox(height: 24),
          const NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(),
        ],
      ),
    );
  }

   Widget buildName() => Column(
        children: [
          Text(
            userName ?? 'Loading...', // Display a placeholder or loading text
            style: const TextStyle(fontSize: 18),
          ),
        ],
      );

  Widget buildEmail() => Column(
        children: [
          Text(
            userEmail ?? 'Loading...', // Display a placeholder or loading text
            style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
          ),
        ],
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              userAbout ?? 'Loading...', // Display a placeholder or loading text
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
}