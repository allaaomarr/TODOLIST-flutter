import 'package:flutter/material.dart';
import 'package:todo/todo/view/home.dart';

void main() {
  runApp(MaterialApp(home :home(), darkTheme: ThemeData(

    brightness: Brightness.dark,
    /* dark theme settings */
  ), theme: ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrange,

 focusColor: Colors.deepOrange,

    // Define the default font family.
    fontFamily: 'Georgia',

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  ),));
}

