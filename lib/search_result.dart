import 'package:flutter/material.dart';
import 'package:fligh_ticket_dealer/main.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import 'custom_shape_cliper.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Search Results'),
          centerTitle: true,
          backgroundColor: firstColor,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              size: 35,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            TopSearchResult(),
            SizedBox(
              height: 25,
            ),
            BottomSearchResult()
          ],
        ));
  }
}

class TopSearchResult extends StatelessWidget {
  const TopSearchResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 140,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [firstColor, secondColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Boston (BOS)',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        'New York City (JFK)',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.swap_horiz,
                            size: 30, color: Colors.grey)))
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BottomSearchResult extends StatelessWidget {
  const BottomSearchResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Best Deals for Next 6 Months',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: flightCards,
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<FlightCard> flightCards = [
  FlightCard(
    price: 4159,
    crossPrice: 9999,
    date: 'June 2019',
    flighName: 'Catary Pcific',
    rating: '4.6',
    percent: 55,
  ),
  FlightCard(
    price: 4159,
    crossPrice: 9999,
    date: 'June 2019',
    flighName: 'American Airline',
    rating: '4.6',
    percent: 55,
  ),
  FlightCard(
    price: 4159,
    crossPrice: 9999,
    date: 'June 2019',
    flighName: 'Catary Pcific',
    rating: '4.6',
    percent: 55,
  ),
  FlightCard(
    price: 4159,
    crossPrice: 9999,
    date: 'June 2019',
    flighName: 'Catary Pcific',
    rating: '4.6',
    percent: 55,
  ),
  FlightCard(
    price: 4159,
    crossPrice: 9999,
    date: 'June 2019',
    flighName: 'Catary Pcific',
    rating: '4.6',
    percent: 55,
  ),
  FlightCard(
    price: 4159,
    crossPrice: 9999,
    date: 'June 2019',
    flighName: 'Catary Pcific',
    rating: '4.6',
    percent: 55,
  ),
  FlightCard(
    price: 4159,
    crossPrice: 9999,
    date: 'June 2019',
    flighName: 'Cambodian Airline',
    rating: '4.6',
    percent: 55,
  )
];

class FlightCard extends StatelessWidget {
  final int price;
  final int crossPrice;
  final String date;
  final String flighName;
  final String rating;
  final int percent;

  const FlightCard(
      {Key key,
      this.price,
      this.crossPrice,
      this.date,
      this.flighName,
      this.rating,
      this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  color: firstColor.withOpacity(.2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                '${this.percent}%',
                style:
                    TextStyle(color: firstColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(.3)),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '${FlutterMoneyFormatter(amount: 4159).output.symbolOnLeft}',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '(${FlutterMoneyFormatter(amount: 4159).output.symbolOnLeft})',
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  runSpacing: -10,
                  spacing: 8,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    FlightTag(
                      icon: Icons.date_range,
                      title: this.date,
                    ),
                    FlightTag(
                      icon: Icons.flight,
                      title: this.flighName,
                    ),
                    FlightTag(
                      icon: Icons.star,
                      title: this.rating,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlightTag extends StatelessWidget {
  final IconData icon;
  final String title;

  const FlightTag({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(this.title),
      avatar: Icon(
        this.icon,
        size: 15,
      ),
      backgroundColor: Colors.grey.withOpacity(.1),
    );
  }
}
