import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wab_signin_signup/Admin/UsersPage.dart';
import '../custom.dart';
import 'BusPage.dart';
import 'ReservationPage.dart';

class AdminPage extends StatefulWidget {
  @override
  State<AdminPage> createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {
  //Notif variable exemple
  String notif_Title = "Lome-Kara";
  String notif_Body = "You have booked Lome-Kara Travel";
  String currentPage="";
  final boxPadding = EdgeInsets.all(10);
  final boxMargin = EdgeInsets.all(10);
  StatefulWidget setCurrentPage = BusPage();
  //IMPORTATION OF USER NOTIFICATION ON DB OR SQLITE(Local DB)
  Widget box({
    required String img,
    VoidCallback? onClicked
  }) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: boxMargin,
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(img),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(

        ),
          child:Container(
            height: 100,
            child: Column(
              children: [
                SizedBox(height: 48,),
                Text(currentPage,textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.grey),),
                Row(
                  children: [
                    box(img: "images/user1.png",onClicked: ()=>setState(() {
                      currentPage = "Users Page";
                      setCurrentPage = UsersPage();
                      Navigator.pop(context);
                    })),
                    box(img: "images/reserve1.png",onClicked: ()=>setState(() {
                      currentPage = "Reservation Page";
                      setCurrentPage = ReservationPage();
                      Navigator.pop(context);
                    })),
                    box(img: "images/bus1.png",onClicked: ()=>setState(() {
                      currentPage = "Bus Page";
                      setCurrentPage = BusPage();
                      Navigator.pop(context);
                    })),
                  ],
                ),
              ],
            ),
          ),
      ),
      appBar: GradiantAppBar(title: currentPage),
      body:setCurrentPage,

    );
  }
}
