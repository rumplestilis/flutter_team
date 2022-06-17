import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../ressource/color.dart';
import '../../ticket_f/ticket.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Ticket ticket;

  const DetailsScreen({Key? key, required this.ticket}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: Body(
        ticket: ticket,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,

    );
  }
}
