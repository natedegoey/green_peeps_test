import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PieDiagram extends StatelessWidget {
  PieDiagram({Key? key}) : super(key: key);

  final List<Color> _pieChartColors = <Color>[
    Colors.teal.shade200,
    Colors.teal.shade300,
    Colors.teal.shade400,
    Colors.teal,
    Colors.teal.shade600,
    Colors.teal.shade700,
    Colors.teal.shade800,
    Colors.teal.shade900
  ];

  final Map<String, double> carbonEmissions = {
    "Food": 0,
    "Electricity": 0,
    "Water": 0,
    "Transportation": 0,
  };

  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> users = FirebaseFirestore.instance
        .collection('users')
        .doc('nFSUjg7UBookPXllvk0d')
        .snapshots();

    return StreamBuilder<DocumentSnapshot>(
      stream: users,
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var userData = snapshot.data;
          Map<String, double> carbonEmissions =
              Map<String, double>.from(userData!["carbonEmissions"]);

          return PieChart(
            dataMap: carbonEmissions,
            chartLegendSpacing: 25,
            chartRadius: MediaQuery.of(context).size.width /
                2, // Half the width of the screen
            colorList: _pieChartColors,
            legendOptions: const LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              legendTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
          );
        } else {
          return PieChart(
            dataMap: carbonEmissions,
            chartLegendSpacing: 25,
            chartRadius: MediaQuery.of(context).size.width /
                2, // Half the width of the screen
            colorList: _pieChartColors,
            legendOptions: const LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              legendTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
          );
        }
      },
    );
  }
}
