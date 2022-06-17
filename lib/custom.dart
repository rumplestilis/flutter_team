import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wab_signin_signup/main.dart';
import 'package:wab_signin_signup/notification.dart';
import 'package:wab_signin_signup/ressource/color.dart';
import 'package:wab_signin_signup/search.dart';

import 'Admin/AdminPage.dart';

//Custom AppBar

class AppBarCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 80);
    path.quadraticBezierTo(width / 2, height, width, height - 80);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    //throw UnimplementedError();
    return true;
  }
}

// ****** BEGIN! DRAWER MENU ******///
Widget buildItemMenu(
    {required String title,
    required IconData icon,
    VoidCallback? onClickMenu}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      title,
      style: TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClickMenu,
  );
}
final padding = EdgeInsets.symmetric(horizontal: 20);
Widget customDrawer(BuildContext context) => Drawer(
      elevation: 2,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(50, 75, 205, 1),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0.2, 0.2),
                  color: Colors.black),
            ]),
        child: ListView(
          padding: padding,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            RoundBtn(name: "Search", onclickedRoundBtn: ()=>PushPage(context, Search())),
            const SizedBox(
              height: 48,
            ),
            buildItemMenu(
                title: "Home",
                icon: Icons.home,
                onClickMenu: () => selectedItemMenu(context, 0)),
            buildItemMenu(
                title: "Package",
                icon: Icons.shopping_bag_outlined,
                onClickMenu: () => selectedItemMenu(context, 1)),
            buildItemMenu(
                title: "Special Offert",
                icon: Icons.local_offer_outlined,
                onClickMenu: () => selectedItemMenu(context, 2)),
            buildItemMenu(
                title: "Blog",
                icon: Icons.more_horiz,
                onClickMenu: () => selectedItemMenu(context, 3)),
            buildItemMenu(
                title: "Update",
                icon: Icons.update,
                onClickMenu: () => selectedItemMenu(context, 3)),
            Divider(
              height: 48,
              color: Colors.white,
            ),
            buildItemMenu(
                title: "Notification",
                icon: Icons.notifications_none,
                onClickMenu: () => selectedItemMenu(context, 3)),
            buildItemMenu(
                title: "Contact us",
                icon: Icons.contact_support_outlined,
                onClickMenu: () => selectedItemMenu(context, 3)),
            buildItemMenu(
                title: "Administrator",
                icon: Icons.contact_support_outlined,
                onClickMenu: () => selectedItemMenu(context, 4)),
          ],
        ),
      ),
    );

void selectedItemMenu(BuildContext context, int index) {

  switch(index){
    case 0: PushPage(context,MyApp());
    break;

    case 3: PushPage(context, NotificationPage());
    break;
    case 4: PushPage(context, AdminPage());
    break;
  }
}
// ****** END! DRAWER MENU ******///
//Custom Rounded Button
Widget RoundBtn({
  required String name,
  VoidCallback? onclickedRoundBtn,
}) =>
    ElevatedButton(
      onPressed: onclickedRoundBtn,
      child: Text(name),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: Size(200, 45),
          primary: Color.fromRGBO(47, 108, 147, 1)),
    );

/// Custom Rounded TextFeild
Widget CustomTextField(String name) => Container(
      height: 40,
      padding: EdgeInsets.fromLTRB(20, 0, 15, 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
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
          hintText: name,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget CustomItBox(String itName, String itDate, String itPrice, String itImg,
        BuildContext context, StatefulWidget? action) =>
    Container(
      margin: EdgeInsets.all(5),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(1, 1),
              color: Colors.grey.withOpacity(0.5),
            )
          ]),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/car1.jpg")),
            ),
            child: Text(
              itName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text("Depart : " + itDate),
                Text("Prix : " + itPrice + " Fcfa"),
              ],
            ),
          ),
        ],
      ),
    );

//Fast Push Back Navigator

void PushPage(BuildContext context, final page) {
  //Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (_) => page!));
}

PreferredSizeWidget GradiantAppBar({
   required String title,
    final leadingOption
}) => AppBar(
  title: Text(title),
  centerTitle: true,
  leading: leadingOption,
  flexibleSpace: Container(
    decoration: BoxDecoration(gradient: gradientBgList),
  ),
);
//Here is the Background and appBar gradient Colors
Gradient gradientBgList = LinearGradient(colors: [
  Colors.teal,
  Color.fromRGBO(155, 105, 243, 1),
]);


AppBar buildAppBar({
  required String title,
  BuildContext? context,
}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    centerTitle: false,
    title: Text(title),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/notification.svg"),
        onPressed: () {
          PushPage(context!, NotificationPage());
        },
      ),
    ],
  );
}
AppBar SimpleAppBar({
  required String title,
  BuildContext? context,
}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    leading: IconButton(icon: Icon(Icons.arrow_back_rounded),onPressed: (){
      Navigator.pop(context!);
    },),
  );
}

