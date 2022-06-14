import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wab_signin_signup/custom.dart';
import 'package:wab_signin_signup/reservation.dart';
import 'package:wab_signin_signup/signIn.dart';
import 'package:wab_signin_signup/signUp.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    double boxHeight = 55;
    double boxWidth = MediaQuery.of(context).size.width / 2 - 20;
    Color boxColor = Colors.white;
    double paddindInset = 20;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.teal,
          Color.fromRGBO(155, 105, 243, 1),
        ])),
        child: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                      ),
                    ),
                    Text(
                      "Search Your It",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  Column(),
                ],
              ),
            SizedBox(height: 50,),
            Image(
              image: AssetImage("images/waypoint.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 2 - 300),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              margin: EdgeInsets.only(left: 15, right: 15),
              height: boxHeight,
              decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(1, 1),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]),
              child: TextField(
                decoration:
                    InputDecoration(labelText: "from", border: InputBorder.none),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              height: boxHeight,
              decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(1, 1),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]),
              child: TextField(
                decoration:
                    InputDecoration(labelText: "to", border: InputBorder.none),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                  height: boxHeight,
                  width: boxWidth,
                  decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Date", border: InputBorder.none),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(top: 10, right: 0),
                  height: boxHeight,
                  width: boxWidth,
                  decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Passagers"),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            RoundBtn("Search", context, null)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
