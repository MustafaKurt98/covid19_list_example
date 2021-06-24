import 'package:flutter/material.dart';

class Country extends StatefulWidget {
  Country({Key key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Country"),
    );
  }
}