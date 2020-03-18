import 'package:fligh_ticket_dealer/custom_bottom_bar.dart';
import 'package:fligh_ticket_dealer/custom_shape_cliper.dart';
import 'package:fligh_ticket_dealer/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeTopPart(),
            SizedBox(
              height: 20,
            ),
            homeBottom,
            SizedBox(
              height: 20,
            ),
            homeBottom
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class HomeTopPart extends StatefulWidget {
  @override
  _HomeTopPartState createState() => _HomeTopPartState();
}

class _HomeTopPartState extends State<HomeTopPart> {
  bool isFlight = true;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShapeClipper(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [firstColor, secondColor])),
        height: 360,
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
              height: 20,
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
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchResult()));
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 14)),
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
                    child: Choice(
                      Icons.flight,
                      'Flights',
                      isFlight,
                    )),
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
            ),
          ]),
        ),
      ),
    );
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
            size: 17,
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

var homeBottom = Column(
  children: <Widget>[
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Text("Currently Watched Items"),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Text("VIEW ALL(12)",
                style: TextStyle(
                  color: firstColor,
                )),
          )
        ],
      ),
    ),
    SizedBox(
      height: 15,
    ),
    Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160,
            child: cards[0],
          ),
          Container(
            width: 160,
            child: cards[1],
          ),
          Container(width: 160, child: cards[2]),
        ],
      ),
    )
  ],
);

List cards = [
  ItemCard(
    city: 'Las Vegas',
    date: 'Feb 2019',
    percent: 45,
    image:
        'https://assets.simpleviewcms.com/simpleview/image/upload/c_fill,h_529,q_75,w_355/v1/clients/lasvegas/strip_b86ddbea-3add-4995-b449-ac85d700b027.jpg',
    price: 1250,
    crossPrice: 2299,
  ),
  ItemCard(
    city: 'New York',
    date: 'Jan 2019',
    percent: 60,
    image: 'https://c.stocksy.com/a/BQc400/z9/1101007.jpg?1575641720',
    price: 1450,
    crossPrice: 1299,
  ),
  ItemCard(
    city: 'Los Santos',
    date: 'Mar 2020',
    percent: 100,
    image: 'https://24.media.tumblr.com/tumblr_mcq8ytMeJG1r0ijkmo1_500.jpg',
    price: 2250,
    crossPrice: 4299,
  )
];

class ItemCard extends StatelessWidget {
  final String city;
  final String date;
  final int percent;
  final String image;
  final double price;
  final double crossPrice;

  const ItemCard(
      {Key key,
      this.city,
      this.date,
      this.percent,
      this.image,
      this.price,
      this.crossPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Stack(
              children: <Widget>[
                Container(
                    height: 210, width: 160, child: Image.network(this.image)),
                Positioned(
                    bottom: 0,
                    left: 0,
                    height: 60,
                    width: 160,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Colors.black87,
                            Colors.black.withOpacity(0.05)
                          ])),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '$city',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              '$date',
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 11),
                            )
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: Colors.white,
                            ),
                            child: Text(
                              '$percent%',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                FlutterMoneyFormatter(amount: this.price).output.symbolOnLeft,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '(${FlutterMoneyFormatter(amount: this.crossPrice).output.symbolOnLeft})',
                style: TextStyle(
                    color: Colors.black26,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          ),
        )
      ],
    );
  }
}
