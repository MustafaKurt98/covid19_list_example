import 'package:covid19_list_example/models/global_summary.dart';
import 'package:covid19_list_example/screens/global_loading.dart';
import 'package:covid19_list_example/screens/global_statistics.dart';
import 'package:covid19_list_example/services/covid_service.dart';
import 'package:flutter/material.dart';

CovidService covidService = CovidService();

class Global extends StatefulWidget {
  Global({Key key}) : super(key: key);

  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  Future<GlobalSummaryModel> summary;

  @override
  void initState() {
    super.initState();
    summary = covidService.getGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Global Covid-19 Verileri",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    summary = covidService.getGlobalSummary();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: summary,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text("Hata"),
              );
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return GlobalLoading();

              default:
                return !snapshot.hasData
                    ? Center(
                        child: Text("Empty"),
                      )
                    : GlobalStatistics(
                        summary: snapshot.data,
                      );
            }
          },
        ),
      ],
    );
  }
}
