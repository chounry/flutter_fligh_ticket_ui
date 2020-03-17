import 'package:fligh_ticket_dealer/custom_shape_cliper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Color firstColor = Color(0xFFF68015);
Color secondColor = Color(0xFFF06D2A);

List<String> locations = ['Boston(BOS)', 'New York(NY)'];
int selectedLocation = 0;

class _MyHomePageState extends State<MyHomePage> {
  bool isFlight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            height: 400,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 120),
                    ),
                    Icon(Icons.location_on, color: Colors.white),
                    SizedBox(
                      width: 5,
                    ),
                    PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocation = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(locations[selectedLocation],
                                style: TextStyle(color: Colors.white)),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 18,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext ctx) => <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(locations[0]),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(locations[1]),
                                value: 1,
                              )
                            ]),
                    Spacer(),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Where would\n you want to go?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFFFEFD6),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: TextField(
                      controller: TextEditingController(text: locations[0]),
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                          suffixIcon: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 14)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFlight = true;
                          });
                        },
                        child: Choice(Icons.flight, 'Flights', isFlight)),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFlight = false;
                          });
                        },
                        child: Choice(Icons.hotel, 'Hotels', !isFlight))
                  ],
                )
              ]),
            ),
          ),
        )
      ],
    ));
  }
}

class Choice extends StatefulWidget {
  IconData icon;
  bool isSelected;
  String title;

  Choice(this.icon, this.title, this.isSelected);

  @override
  _ChoiceState createState() {
    return _ChoiceState();
  }
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(10)))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
