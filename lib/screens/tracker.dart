import 'package:covid19_list_example/screens/country.dart';
import 'package:covid19_list_example/screens/global.dart';
import 'package:covid19_list_example/utils/constants.dart';
import 'package:flutter/material.dart';
import 'navigation_option.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
}

class Tracker extends StatefulWidget {
  Tracker({Key key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          "COVID-19 ARAYUZU",
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: navigationStatus == NavigationStatus.GLOBAL
                    ? Global()
                    : Country(),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NavigationOption(
                    title: "Dünya",
                    selected: navigationStatus == NavigationStatus.GLOBAL,
                    onSelected: () {
                      setState(() {
                        navigationStatus = NavigationStatus.GLOBAL;
                      });
                    }),
                NavigationOption(
                    title: "Ülkeler",
                    selected: navigationStatus == NavigationStatus.COUNTRY,
                    onSelected: () {
                      setState(() {
                        navigationStatus = NavigationStatus.COUNTRY;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
