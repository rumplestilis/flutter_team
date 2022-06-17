import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wab_signin_signup/custom.dart';
import 'package:searchfield/searchfield.dart';


class Search extends StatefulWidget {
  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  int _counter = 0;
  double boxHeight = 55;
  Color boxColor = Colors.white;
  double paddindInset = 20;
  EdgeInsetsGeometry boxPadding = const EdgeInsets.only(left: 10);
  EdgeInsetsGeometry boxMargin =
      const EdgeInsets.only(left: 15, right: 15, top: 10);


  //Text after the map Image
  String searchBannerText = "Explore the beauty of Beautiful World";

  //List of search Destination suggestion
  final List<String> _suggestions = [
    'United States',
    'Germany',
    'Washington',
    'Paris',
    'Jakarta',
    'Australia',
    'Aulimpia',
    'India',
    'Czech Republic',
    'Lorem Ipsum',
  ];
  final List<String> _statesOfIndia = [
    'Andhra Pradesh',
    'Assam',
    'Arunachal Pradesh',
    'Bihar',
    'Goa',
    'Gujarat',
    'Jammu and Kashmir',
    'Jharkhand',
    'West Bengal',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Orissa',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Tripura',
    'Uttaranchal',
    'Uttar Pradesh',
    'Haryana',
    'Himachal Pradesh',
    'Chhattisgarh'
  ];
  final _formKey = GlobalKey<FormState>();

  //actual city of the person
  final _searchControllerLocation = TextEditingController();

  //destination of the person
  final _searchControllerDestination = TextEditingController();

  DateTime date = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.of(context).size.width / 2 - 30;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: gradientBgList),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(gradient: gradientBgList),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Image(
                image: AssetImage("images/waypoint.png"),
              ),

              //HERE THE TOP BANNER TEXT
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(searchBannerText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 37,
                    ),
                    textAlign: TextAlign.left),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  margin: boxMargin,
                  height: boxHeight,
                  decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  child: SearchField(
                    suggestionState: Suggestion.expand,
                    suggestionAction: SuggestionAction.next,
                    suggestions:
                        _suggestions.map((e) => SearchFieldListItem(e)).toList(),
                    textInputAction: TextInputAction.next,
                    searchInputDecoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.location_on_outlined),
                    ),
                    controller: _searchControllerLocation,
                    hint: "from",
                    // initialValue: SearchFieldListItem(_suggestions[2], SizedBox()),
                    maxSuggestionsInViewPort: 3,
                    itemHeight: 45,
                    onSuggestionTap: (x) {},
                  )),
              Container(
                padding: boxPadding,
                margin: boxMargin,
                height: boxHeight,
                decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: Colors.black.withOpacity(0.5),
                      )
                    ]),
                child: SearchField(
                  suggestionState: Suggestion.expand,
                  suggestionAction: SuggestionAction.next,
                  suggestions:
                      _suggestions.map((e) => SearchFieldListItem(e)).toList(),
                  textInputAction: TextInputAction.next,
                  searchInputDecoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.location_on_outlined),
                  ),
                  controller: _searchControllerDestination,
                  hint: "to",
                  // initialValue: SearchFieldListItem(_suggestions[2], SizedBox()),
                  maxSuggestionsInViewPort: 3,
                  itemHeight: 45,
                  onSuggestionTap: (x) {},
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: boxPadding,
                    margin: boxMargin,
                    height: boxHeight,
                    width: boxWidth+10,
                    decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                            color: Colors.black.withOpacity(0.5),
                          )
                        ]),
                    child: TextField(
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(3000));

                        if (newDate == null) return;
                        setState(() {
                          date = newDate;
                        });
                      },
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.date_range_rounded),
                          label: Text(date.year.toString() +
                              "-" +
                              date.month.toString() +
                              "-" +
                              date.day.toString()),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: boxPadding,
                    margin: boxMargin,
                    height: boxHeight,
                    width: boxWidth-10,
                    decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                            color: Colors.black.withOpacity(0.5),
                          )
                        ]),
                    child: const TextField(
                      decoration: InputDecoration(
                          label: Text("Budget"), border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              RoundBtn(name: "Search", onclickedRoundBtn: (){})
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
