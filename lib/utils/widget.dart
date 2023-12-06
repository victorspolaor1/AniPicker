import 'package:flutter/material.dart';

MaterialButton longButtons(String title, Function fun,
    {Color color = Colors.blue, Color textColor= Colors.white}) {
  return MaterialButton(
    onPressed: () => {

    },
    textColor: textColor,
    color: color,
    height: 45,
    minWidth: 600,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
  );
}