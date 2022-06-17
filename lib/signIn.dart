import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wab_signin_signup/custom.dart';
import 'package:wab_signin_signup/ressource/color.dart';
import 'package:wab_signin_signup/signUp.dart';

import 'main.dart';

class SignIn extends StatefulWidget {
  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(title: "",context: context),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/car1.jpg"),
                Text(
                  "Sign In",
                  style: TextStyle(
                      fontFamily: "Cacadia Code",
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(47, 10, 101, 1)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        )
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Téléphone :",
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        )
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password : ",
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUp()));
                  },
                  icon: Icon(Icons.arrow_right_alt_rounded),
                  label: Text("Sign In"),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(47, 108, 147, 1),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUp()));
                  },
                  icon: Icon(Icons.arrow_right_alt_rounded),
                  label: Text("Inscription"),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(47, 108, 147, 1),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                )
              ],
            ),
          ),
        ));
  }
}
