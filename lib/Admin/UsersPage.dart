import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../custom.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPage();
}

class _UsersPage extends State<UsersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return reservationList(userNom: "Thamibe",
                userPrenom: "Isidore",
                userTel: "90210990",
                userMail: "example@gmail.com",
                userAdresse: "Lome");
          }),
    );
  }

  Widget reservationList({
    required String userNom,
    required String userPrenom,
    required String userTel,
    required String userMail,
    required String userAdresse,
  }) {
    double iconSize = 18;
    final textStyle = TextStyle(
      fontSize: 12,
    );
    return ExpansionTile(title: Text(" $userNom: $userPrenom"),
      backgroundColor: Colors.grey,
      children: [
        ListTile(
          leading: Icon(Icons.mail, size: iconSize,),
          title: Text('Email :  $userMail', style: textStyle,),
          subtitle: Text("Adresse : $userAdresse", style: textStyle,),
        ),
        ListTile(
          leading: Icon(Icons.phone, size: iconSize,),
          title: Text('Telephone :  $userTel', style: textStyle,),
          subtitle: Text("Nom : $userNom $userPrenom", style: textStyle,),
        ),
      ],
    );
  }
}