import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Custom AppBar

class AppBarCustomShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 80);
    path.quadraticBezierTo(width/2, height, width, height-80);
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
//Custom Rounded Btn
Widget RoundBtn(String name, BuildContext context, StatefulWidget? action) =>
    ElevatedButton(
      onPressed: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => action!)),
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
          ]
      ),
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
               fit: BoxFit.cover,
                image: AssetImage("images/car1.jpg")
              ),
            ),
            child: Text(itName,textAlign: TextAlign.center,style: TextStyle(fontSize: 32,color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text("Depart : "+itDate),
                Text("Prix : "+itPrice+" Fcfa"),
              ],
            ),
          ),
        ],
      ),
    );


//Fast Push Back Navigator

void PushPage(BuildContext context, StatefulWidget page){
  Navigator.push(context, MaterialPageRoute(builder: (_)=>page));
}