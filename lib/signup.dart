import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'login.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  dynamic email = TextEditingController();
  dynamic pass = TextEditingController();
  dynamic name = TextEditingController();

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(204, 255, 255, 255),
        body: Stack(
          children: [
            
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /*
                    head(),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Register with one of the following options',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          buildgoogleicon(),
                          const SizedBox(width: 30),
                          buildappleicon(),
                        ],
                      ),
                    ),
                    */
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 23,
                                color: Color.fromARGB(255, 12, 12, 12),
                                fontFamily: 'Satisfy-Regular',
                              ),
                            ),
                          ),
                          buildname(name),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 23,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Satisfy-Regular',
                              ),
                            ),
                          ),
                          buildemail(email),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 23,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Satisfy-Regular',
                              ),
                            ),
                          ),
                          buildpass(pass),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10, bottom: 10),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.circular(22)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 25,),
                      ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: const Text(
                        'Already have an account? Log in',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
/*
Widget backgroundimage() => Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('../asset/images/homepage_background.jpg'),
        fit: BoxFit.cover,
      )),
    );
*/

Widget head() => Padding(
      padding: const EdgeInsets.only(
        bottom: 50.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(128, 0, 128, 1),
                    Color.fromRGBO(179, 0, 179, 1),
                    Color.fromRGBO(204, 0, 204, .8)
                  ]),
            ),
          ),
          const Text(
            'App_Name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Pacifico-Regular',
              fontSize: 55,
            ),
          ),
        ],
      ),
    );

/*
Widget buildgoogleicon() => Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.5,
            color: const Color.fromRGBO(52, 52, 52, 1),
          ),
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(30, 30, 30, .51),
        ),
        child: MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          onPressed: () {},
          child: const Image(
            image: AssetImage('asset/white-google-logo.png'),
            width: 30,
            height: 30,
          ),
        ),
      ),
    );

Widget buildappleicon() => Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.5,
            color: const Color.fromRGBO(52, 52, 52, 1),
          ),
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(30, 30, 30, .51),
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.apple,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
*/
Widget buildemail(var email) => TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: email,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.5,
            color: Color.fromRGBO(255, 0, 0, 1),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: GradientOutlineInputBorder(
          width: 3.0,
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(128, 0, 128, 1),
                Color.fromRGBO(179, 0, 179, 1),
                Color.fromRGBO(204, 0, 204, .8)
              ]),
        ),
        prefixIcon: const Icon(Icons.email_rounded, color: Color.fromARGB(255, 255, 1, 1)),
        filled: true,
        fillColor: const Color.fromRGBO(130, 155, 154, 154),
      ),
    );

Widget buildpass(var pass) => TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      controller: pass,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.5,
            color: Color.fromRGBO(255, 0, 0, 1),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: GradientOutlineInputBorder(
          width: 3.0,
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(128, 0, 128, 1),
                Color.fromRGBO(179, 0, 179, 1),
                Color.fromRGBO(204, 0, 204, .8)
              ]),
        ),
        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 255, 0, 0)),
        filled: true,
        fillColor: const Color.fromRGBO(130, 155, 154, 154),
      ),
    );

Widget buildname(var name) => TextFormField(
      keyboardType: TextInputType.name,
      controller: name,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.5,
            color: Color.fromRGBO(255, 0, 0, 1),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: GradientOutlineInputBorder(
          width: 3.0,
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(128, 0, 128, 1),
                Color.fromRGBO(179, 0, 179, 1),
                Color.fromRGBO(204, 0, 204, .8)
              ]),
        ),
        prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 255, 0, 0)),
        filled: true,
        fillColor: const Color.fromRGBO(130, 155, 154, 154),
      ),
    );

/*
Widget buldbuttonregister() => Container(
      width: 250,
      height: 80,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(128, 0, 128, 1),
              Color.fromRGBO(179, 0, 179, 1),
              Color.fromRGBO(204, 0, 204, .8)
            ]),
        borderRadius: BorderRadius.circular(22),
      ),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        splashColor: const Color.fromRGBO(30, 30, 30, .51),
        child: const Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico-Regular',
          ),
        ),
      ),
    );
*/