import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(201, 255, 255, 255),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:60.0),
                    child: Center(
                      child: SizedBox(
                        width: 400,
                        height: 250,
                        child: Image.asset('../asset/images/anipicker-logo.PNG'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Container(
                      width: 209,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 0, 0),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(40),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(241, 240, 241, 1),
                              Color.fromRGBO(254, 254, 255, 1),
                              Color.fromRGBO(179, 177, 179, 1),
                              Color.fromRGBO(112, 111, 112, 1)
                            ]),
                      ),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Log in    ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico-Regular',
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              size: 40,
                              color: Color.fromARGB(255, 255, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Container(
                      width: 209,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 250, 0, 0),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(40),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(241, 240, 241, 1),
                              Color.fromRGBO(254, 254, 255, 1),
                              Color.fromRGBO(179, 177, 179, 1),
                              Color.fromRGBO(112, 111, 112, 1)
                            ]),
                      ),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico-Regular',
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              size: 40,
                              color: Color.fromARGB(255, 255, 0, 0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Welcome',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}*/