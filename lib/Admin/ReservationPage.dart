import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../custom.dart';

class ReservationPage extends StatefulWidget {
  @override
  State<ReservationPage> createState() => _ReservationPage();
}

class _ReservationPage extends State<ReservationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return reservationList(numReservation: "58", nomReservateur: "Galanga Sangol Ramses", itineraire: "XX",coutReservation: 18000 ,numSiege: 12, nbSiegeReserve: 2,date: "01-01-2022");
        }),
      );
  }

  Widget reservationList({
    required String numReservation,
    required String nomReservateur,
    required String itineraire,
    required double coutReservation,
    required int numSiege,
    required int nbSiegeReserve,
    required String date
}){
    double iconSize = 18;
    final textStyle = TextStyle(
      fontSize: 12,
    );
    return ExpansionTile(title: Text("${numReservation} : ${nomReservateur}"),
    backgroundColor: Colors.grey,
    children: [
      ListTile(
        leading: Icon(Icons.route,size: iconSize,),
        title: Text('Itineraire :  $itineraire',style: textStyle,),
        subtitle: Text("Cout : $coutReservation fcfa",style: textStyle,),
      ),
      ListTile(
        leading: Icon(Icons.man,size: iconSize,),
        title: Text('Passagers :  $nbSiegeReserve',style: textStyle,),
        subtitle: Text("N° Siege : $numSiege",style: textStyle,),
      ),
      ListTile(
        leading: Icon(Icons.date_range_rounded,size: iconSize,),
        title: Text('Date :  $date',style: textStyle,),
      )
    ],
    );
  }
}
