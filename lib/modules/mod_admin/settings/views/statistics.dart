import 'dart:math';

import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        title: Text("Statistics"),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                ListTile(
                  title: Text(
                    "Weekly Appointments",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                       
                        fontWeight: FontWeight.bold),
                  ),
                  trailing:
                      IconButton(icon: Icon(Icons.sort, color: AppTheme.borderColor,), onPressed: () {}),
                ),
                Expanded(child: _statsList()),
              ],
            )),
      ),
    );
  }

  Widget _statsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return RoundedCard(
          circularRadius: 10,
          cardColor: AppTheme.primaryColorLight,
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              isThreeLine: true,
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Week ${index + 1}",
                          style: Theme.of(context).textTheme.subtitle1),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Text(
                          "21 Appointments",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 120,
                      width: 120,
                      child: GaugeChart.withSampleData()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GaugeChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory GaugeChart.withSampleData() {
    return new GaugeChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,

        // Configure the width of the pie slices to 30px. The remaining space in
        // the chart will be left as a hole in the center. Adjust the start
        // angle and the arc length of the pie so it resembles a gauge.
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 10, startAngle: 4 / 5 * pi, arcLength: 7 / 5 * pi));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GaugeSegment, String>> _createSampleData() {
    final data = [
      new GaugeSegment('Low', 75),
      //  new GaugeSegment('Acceptable', 100),
    ];

    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(AppTheme.accentColor),
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(AppTheme.accentColor),
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: data,
      )
    ];
  }
}

/// Sample data type.
class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}
