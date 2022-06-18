import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'custom.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _Notification();
}

class _Notification extends State<NotificationPage> {
  //Notif variable exemple
  String notif_Title = "Lome-Kara";
  String notif_Body = "You have booked Lome-Kara Travel";

  //IMPORTATION OF USER NOTIFICATION ON DB OR SQLITE(Local DB)
  List<String> UserNotif_FromDB = [];

  void test() async{
    final reponse = await http.get(Uri.parse("http://localhost/Wab/test.php"));
    if(reponse.statusCode == 200){
      print('reussi');
      var data = jsonDecode(reponse.body);
      print(data);

    }
}

  Widget notifBox(String title, String body) => Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
              offset: Offset(0.1,0.1),
              color: Colors.grey
          )
        ]
      ),
      child: ListTile(
        title: Text(notif_Title),
        tileColor: Colors.white70,
        subtitle: Text(notif_Body),
        visualDensity: VisualDensity.comfortable,
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            test();
          },
        ),
      ));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: customDrawer(context),
        appBar: SimpleAppBar(title:"",context: context),
        body: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return notifBox(notif_Title, notif_Body);
            }));
  }


}
