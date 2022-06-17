import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wab_signin_signup/affichageressource/details/components/ticket_info.dart';
import 'package:http/http.dart' as http;

import '../../../custom.dart';
import '../../../ressource/color.dart';
import '../../../ticket_f/ticket.dart';
import 'ticket_image.dart';


class Body extends StatelessWidget {
  @override
  void apiTest() async{
    final requete = await http.get(Uri.parse("http://localhost/Wab/php/afficher.php?id="));
    final reponse = jsonDecode(requete.body);
    debugPrint(reponse);
  }

  final Ticket ticket;
  const Body({Key? key, required this.ticket}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: kDefaultPaddingV),

              decoration: BoxDecoration(

                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${ticket.id}',
                      child: TicketPoster(
                        size: size,
                        image: ticket.image,
                      ),
                    ),
                  ),
                  Center(
                    child: Hero(
                      tag: '${ticket.id}',
                      child: Ticketinfo(
                        size: size,
                        title: ticket.title,
                        price: ticket.price,
                        description: ticket.description,
                        numplace: '${ticket.numplace}',
                        nbplace: ticket.nbplace,
                      ),
                    ),
                  ),
                  // ListOfColors(key: key!,),

                  SizedBox(height: kDefaultPadding),
                ],
              ),
            ),SizedBox(height: 20,),

            FloatingActionButton.extended(
              heroTag: null,
              onPressed: () {
                apiTest();// Add your onPressed code here!
      },  backgroundColor: kSecondaryColor,
              icon: const Icon(Icons.send),
              label: const Text('Valider'),
            ),
            //  ChatAndAddToCart(key: key!,),
          ],
        ),
      ),
    );
  }


}
