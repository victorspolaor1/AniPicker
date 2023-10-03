import 'package:flutter/material.dart';
import 'action-pages/account.dart';
import 'action-pages/animeswatched.dart';
import 'action-pages/randompicker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Navigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(
          width: 200,
          height: 200,
          child: Transform.scale(
            scale: 4,
              child: IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(left: 25),
              icon: Image.asset('../asset/images/anipicker-logo.png'),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: index,
        children: [
          Account(),
          RandomPicker(),
          AnimesWatched(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int newindex) {
          setState(() {
            index = newindex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.repeat),
            label: 'Random picker'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Animes watched",
          ),
        ],
      ),
    );
  }
}