
import 'package:flutter/material.dart';

import 'package:wab_signin_signup/ressource/color.dart';

import '../signUp.dart';
class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected
  int selectedIndex = 0;
  List categories = ['réservé', 'Ticket', 'compte', 'Aide'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(
                    () {
                  selectedIndex = index;
                  switch (index) {
                    case 0:

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp()
                            ),
                        );

                      break;
                    case 1:
                      break;
                    case 2:
                      break;
                    case 3:
                      break;
                    default:
                      break;
                  }
                },
              );
            },

        child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          // At end item it add extra 20 right  padding
          right: index == categories.length - 1 ? kDefaultPadding : 0,
        ),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
          color: index == selectedIndex
              ? Colors.black.withOpacity(0.4)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          categories[index],
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    ),
    );
  }
}