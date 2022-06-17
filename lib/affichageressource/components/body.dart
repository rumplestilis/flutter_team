import 'package:flutter/material.dart';

import '../../components/search_box.dart';

import '../../ressource/color.dart';
import '../../ticket_f/ticket.dart';
import '../details/details_screen.dart';
import 'category_list.dart';
import 'reservation_ticket_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      bottom: false,
      child: Column(

        children: <Widget>[
          SearchBox(onChanged: (value) {}),
          CategoryList(),
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
                ListView.builder(
                  // here we use our demo procuts list
                  itemCount: tickets.length,
                  itemBuilder: (context, index) => TicketCard(
                    itemIndex: index,
                    ticket: tickets[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            ticket: tickets[index],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
