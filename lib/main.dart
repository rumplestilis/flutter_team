import 'package:flutter/material.dart';
import 'package:wab_signin_signup/custom.dart';
import 'package:wab_signin_signup/reservation.dart';
import 'package:wab_signin_signup/search.dart';
import 'package:wab_signin_signup/signIn.dart';
import 'package:wab_signin_signup/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.teal),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 50,
        title: Text("Search your IT here"),
        centerTitle: true,
        actions: [
          Icon(Icons.list)
        ],
        flexibleSpace: ClipPath(
          clipper: AppBarCustomShape(),
          child: Container(
            //height: 350,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
          ),
        ),
      )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomTextField("from"),
            SizedBox(
              height: 15,
            ),
            CustomTextField("to"),
            SizedBox(
              height: 15,
            ),
            RoundBtn("Search", context, Search()),
            ListTile(
              leading: Icon(Icons.mode_of_travel_outlined),
              title: Text("Itineraires du jours"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 400,
                child: ListView.builder(
                  itemCount: 3,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                            PushPage(context,Reservation());
                        },
                        child:
                            CustomItBox("Lome-Kara", "20/10/2020", "12000", "Img",
                                context, null)
                      );
                    }
                )
              ),
          ]),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
