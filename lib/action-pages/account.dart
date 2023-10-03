import 'package:flutter/material.dart';


class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);

  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      /// backgroundColor: Color.fromRGBO(58, 0, 95, .81),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}