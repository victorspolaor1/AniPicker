import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'login.dart';
import 'providers/register.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  RestRegisterProvider helper = RestRegisterProvider.helper;
  final pass = TextEditingController();
  final name = TextEditingController();
  final confirmPass = TextEditingController();
  final email = TextEditingController();
  final about = TextEditingController();

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(
          width: 200,
          height: 200,
          child: Transform.scale(
            scale: 6,
              child: IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(left: 25),
              icon: Image.asset('../asset/images/anipicker-logo.png'),
            ),
          ),
        ),
      ),
        backgroundColor: const Color.fromARGB(204, 255, 255, 255),
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
                              'Password',
                              style: TextStyle(
                                fontSize: 23,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Satisfy-Regular',
                              ),
                            ),
                          ),
                          buildpass(pass),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
                            child: Text(
                              'Confirm Password',
                              style: TextStyle(
                                fontSize: 23,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Satisfy-Regular',
                              ),
                            ),
                          ),
                          buildconfirmpass(confirmPass),
                          if (pass.text.isNotEmpty && confirmPass.text.isNotEmpty && pass.text != confirmPass.text)
                          const Text(
                          'Passwords do not match',
                          style: TextStyle(color: Colors.red),
                          ),
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
                              'About',
                              style: TextStyle(
                                fontSize: 23,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Satisfy-Regular',
                              ),
                            ),
                          ),
                          buildabout(about),
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
                          if (pass.text != confirmPass.text) {
                            showAlertDialog(context, 'Please, review the values inserted and try again!', 'Passwords do not match');
                            return;
                        } else {
                          var idUser = await helper.createUser(name.text, pass.text, email.text, about.text);
                          // ignore: unrelated_type_equality_checks
                          if (idUser == 0){
                            // ignore: use_build_context_synchronously
                            showAlertDialog(context, 'X', 'X');
                          }
                          else {
                            // ignore: use_build_context_synchronously
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                          }
                        }
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

Widget buildpass(var pass) => TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      controller: pass,
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
        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 255, 0, 0)),
        filled: true,
        fillColor: const Color.fromRGBO(130, 155, 154, 154),
      ),
    );

    Widget buildconfirmpass(var confirmPass) => TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      controller: confirmPass,
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
        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 255, 0, 0)),
        filled: true,
        fillColor: const Color.fromRGBO(130, 155, 154, 154),
      ),
    );

Widget buildname(var name) => TextFormField(
      keyboardType: TextInputType.name,
      controller: name,
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
        prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 255, 0, 0)),
        filled: true,
        fillColor: const Color.fromRGBO(130, 155, 154, 154),
      ),
    );

Widget buildemail(var email) => TextFormField(
      keyboardType: TextInputType.name,
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
        prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 255, 0, 0)),
        filled: true,
        fillColor: const Color.fromRGBO(130, 155, 154, 154),
      ),
    );

Widget buildabout(var about) => TextFormField(
      maxLines: 3,
      keyboardType: TextInputType.name,
      controller: about,
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
        prefixIcon: const Icon(Icons.description, color: Color.fromARGB(255, 255, 0, 0)),
        filled: true,
        fillColor: const Color.fromRGBO(130, 155, 154, 154),
      ),
    );

 showAlertDialog(BuildContext context, String message, String header) { 
    // configura o button
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      // configura o  AlertDialog
      AlertDialog alerta = AlertDialog(
        title: Text(header),
        content: Text(message),
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