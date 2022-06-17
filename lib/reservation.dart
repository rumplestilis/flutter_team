import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wab_signin_signup/custom.dart';
import 'package:http/http.dart' as http;
import 'package:wab_signin_signup/signIn.dart';
import 'package:wab_signin_signup/signUp.dart';

class Reservation extends StatefulWidget {
  @override
  State<Reservation> createState() => _Reservation();
}

class _Reservation extends State<Reservation> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontSize: 12,
        fontFamily: "Cascadia Code");
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            toolbarHeight: 100,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                )),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Itinéraire Detail",textAlign: TextAlign.center,),
                Row(
                  children: [
                    Text("Lome"),
                    SizedBox(width: 20,),
                    Icon(Icons.airplane_ticket),
                    SizedBox(width: 20,),
                    Text("Kara")
                  ],
                )
              ],
            ),
            centerTitle: true,
            actions: [Icon(Icons.list),
            ],
            flexibleSpace: ClipPath(
              clipper: AppBarCustomShape(),
              child: Container(
                //height: 350,
                width: MediaQuery.of(context).size.width,
                color: Colors.teal,
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.34,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date ", style: titleStyle),
                  Text(
                    "Monday, Jully 15, 2020",
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text("Passager Name", style: titleStyle),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Write your name here",
                        border: InputBorder.none),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Classe",
                            style: titleStyle,
                          ),
                          Text("Boss")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Nb Sièges",
                            style: titleStyle,
                          ),
                          Container(
                            height:  20,
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_circle_left_outlined,size:15,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if(_counter==0);
                                      else
                                        _counter--;
                                    });
                                  },
                                ),
                                Text("${_counter}"),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_circle_right_outlined,size:15,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if(_counter>=5);
                                      else
                                        _counter++;
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "N° Sièges",
                            style: titleStyle,
                          ),
                              Text("A1,A2,A3"),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                 ElevatedButton(onPressed: (){

                 }, child: Text("Confirme"))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(1, 1),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("N° Bus",style: titleStyle,),
                      Text("xxxxxxxxx"),
                      SizedBox(height: 10,),
                      Text("N° ticket", style: titleStyle,),
                      Text("xxxxxxxxx")
                    ],
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/car3.png")
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RoundBtn(name: "Buy", onclickedRoundBtn: (){})
          ]),
        ),
      ),
    );
  }
}
