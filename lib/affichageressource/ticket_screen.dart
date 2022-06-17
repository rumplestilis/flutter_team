
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wab_signin_signup/custom.dart';

import '../ressource/color.dart';
import 'components/body.dart';

class TicketScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "",context: context),
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }
}
