import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'providers/validation.dart';
import 'signup.dart';
import 'actionspage.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  RestDataProvider helper = RestDataProvider.helper;

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
                          padding: EdgeInsets.only(left: 20.0, bottom: 5.0, top: 200),
                          child: Text(
                            'Username',
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
                        onPressed: () async {
                          var idUser = await helper.validateUser(email.text, pass.text);
                          if (idUser == 0){
                            // ignore: use_build_context_synchronously
                            showAlertDialog(context);
                          }
                          else {
                            // ignore: use_build_context_synchronously
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                          }
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
      
  Widget buildemail() => TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: email,
        style: const TextStyle(color: Colors.black),
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
        style: const TextStyle(color: Colors.black),
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

      showAlertDialog(BuildContext context) { 
    // configura o button
        Widget okButton = TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        );
        // configura o  AlertDialog
        AlertDialog alerta = AlertDialog(
          title: const Text("Authentication failed"),
          content: const Text("Wrong username and/or password. Please try again"),
          actions: [
            okButton,
          ],
        );
        // exibe o dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alerta;
          },
        );
      }
}