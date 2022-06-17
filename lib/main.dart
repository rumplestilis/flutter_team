import 'package:flutter/material.dart';
import 'package:wab_signin_signup/affichageressource/ticket_screen.dart';
import 'package:wab_signin_signup/custom.dart';
import 'package:wab_signin_signup/reservation.dart';
import 'package:wab_signin_signup/notification.dart';
import 'package:wab_signin_signup/search.dart';
import 'package:wab_signin_signup/signIn.dart';
import 'package:wab_signin_signup/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wab Bus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          primarySwatch: Colors.teal),
      home: TicketScreen(),
    );
  }
}
