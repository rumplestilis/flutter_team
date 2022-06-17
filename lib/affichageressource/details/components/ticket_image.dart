import 'package:flutter/material.dart';

import '../../../ressource/color.dart';

class TicketPoster extends StatelessWidget {

  const TicketPoster({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

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
                      blurRadius: 30.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0.0, 3.0),
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                ),
              ),

          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              image,
              //height: size.width * 0.75,
              width: size.width * 0.95,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
