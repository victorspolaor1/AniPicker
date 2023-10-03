import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'signup.dart';
import 'actionspage.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// backgroundColor: Color.fromRGBO(58, 0, 95, .81),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                            'Email',
                            style: TextStyle(
                              fontSize: 23,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Satisfy-Regular',
                            ),
                          ),
                        ),
                        buildemail(),
                        const SizedBox(height: 25),
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
                        buildpass(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password',
                          ),
                        )
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
                          context, MaterialPageRoute(builder: (context) => const HomePage()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25,),
                      ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: const Text(
                        'Doesnt have an account? Sign in',
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildlogoImage() => Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('../asset/images/anipicker-logo.PNG'),
          fit: BoxFit.cover,
        )),
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
              image: AssetImage('../asset/images/white-google-logo.png'),
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
  Widget buildemail() => TextFormField(
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
          prefixIcon: const Icon(Icons.email_rounded, color: Colors.red),
          filled: true,
          fillColor: const Color.fromARGB(130, 155, 154, 154),
        ),
      );

  Widget buildpass() => TextFormField(
        keyboardType: TextInputType.visiblePassword,
        style: const TextStyle(color: Colors.white),
        controller: pass,
        obscureText: true,
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
          prefixIcon: const Icon(Icons.lock, color: Colors.red),
          filled: true,
          fillColor: const Color.fromRGBO(130, 155, 154, 154),
        ),
      );

/*
  Widget buldbuttonlogin() => Container(
        width: 250,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 255, 0, 0),
            width: 4,
          ),
          borderRadius: BorderRadius.circular(22),
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
          onPressed: () {
            
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          splashColor: const Color.fromARGB(130, 255, 0, 0),
          child: const Text(
            'Log in',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Satisfy-Regular',
            ),
          ),
        ),
      );
*/
}