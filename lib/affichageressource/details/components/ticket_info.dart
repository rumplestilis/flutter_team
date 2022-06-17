import 'package:flutter/material.dart';

import '../../../ressource/color.dart';

class Ticketinfo extends StatefulWidget {
  Size size;
  String title;
  int price = 0;
  int nbplace = 1;
  String numplace;
  String description;

  Ticketinfo(
      {Key? key,
      required this.size,
      required this.title,
      required this.price,
      required this.nbplace,
      required this.numplace,
      required this.description})
      : super(key: key);

  @override
  State<Ticketinfo> createState() => _Ticketinfo();
}

class _Ticketinfo extends State<Ticketinfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    color: Colors.white70.withOpacity(0.5),
                    offset: const Offset(0.0, 3.0),
                  )
                ],
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // ListOfColors(key: key!,),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 6),
                  child: ListTile(
                    title: Text("Date"),
                    subtitle: Text(
                      widget.description,
                      style: TextStyleA,
                    ),
                  ),
                ),
             ListTile(
                    title: Text("Destination"),
                    subtitle: Text(widget.title, style: TextStyleA),
                  ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Nb Sièges",
                          style: TextStyleC,
                        ),
                        Container(
                          height: 20,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_circle_left_outlined,
                                  size: 15,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (widget.nbplace == 1)
                                      ;
                                    else
                                      widget.nbplace--;
                                  });
                                },
                              ),
                              Text("${widget.nbplace}"),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: 15,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (widget.nbplace >= 5)
                                      ;
                                    else
                                      widget.nbplace++;
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
                          "N° Siege",
                          style: TextStyleB,
                        ),
                        Text(widget.numplace, style: TextStyleA),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
