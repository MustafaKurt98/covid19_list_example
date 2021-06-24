import 'package:covid19_list_example/models/global_summary.dart';
import 'package:covid19_list_example/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlobalStatistics extends StatelessWidget {
  const GlobalStatistics({Key key, this.summary}) : super(key: key);

  final GlobalSummaryModel summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildCard(
          "Onaylanmış Vaka",
          summary.totalConfirmed,
          summary.newConfirmed,
          kConfirmedColor,
        ),
        buildCard(
          "Aktif Vaka",
          summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths,
          summary.newConfirmed - summary.newRecovered - summary.newDeaths,
          kActiveColor,
        ),
        buildCard(
          "İyileşen Hasta",
          summary.totalRecovered,
          summary.newRecovered,
          kRecoveredColor,
        ),
        buildCard(
          "Ölüm",
          summary.totalDeaths,
          summary.newDeaths,
          kDeathColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            "Statistics updated " + timeago.format(summary.date),
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
        )
      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Toplam",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      totalCount.toString().replaceAllMapped(regExp, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Bugün",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      todayCount.toString().replaceAllMapped(regExp, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
