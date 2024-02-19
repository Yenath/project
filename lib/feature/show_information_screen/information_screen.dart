import 'package:blood_sugar_monitor/feature/data_input_screen/input_screen.dart';
import 'package:flutter/material.dart';

import '../data_input_screen/widgets/app_bar_widget.dart';

class InformationScreen extends StatefulWidget {
  final String beforeGlucose;
  final String afterGlucose;
  // final String result;
  const InformationScreen({
    super.key,
    required this.beforeGlucose,
    required this.afterGlucose,
  });

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  String result = '';
  _sugarTypemehtod() {
    if ((int.parse(widget.beforeGlucose) >= 70) && (int.parse(widget.beforeGlucose) < 100) ||
        (100 < int.parse(widget.afterGlucose)) && (int.parse(widget.afterGlucose) < 140)) {
      debugPrint("type 1");
      return result = "Without Diabetes! / Normal!";
    } else if ((100 < int.parse(widget.beforeGlucose)) && (int.parse(widget.beforeGlucose) <= 125) ||
        (140 <= int.parse(widget.beforeGlucose)) && (int.parse(widget.afterGlucose) < 199)) {
      return result = "Prediabetic";
    } else if ((126 < int.parse(widget.beforeGlucose)) && (int.parse(widget.beforeGlucose) <= 199) ||
        (200 <= int.parse(widget.beforeGlucose)) && (int.parse(widget.afterGlucose) > 400)) {
      return result = "Type 2 Diabetic";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sugarTypemehtod();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown.shade300,
        body: Column(
          children: [
            // App bar
            const AppBarWidget(name: "RESULT"),

            // Result Widget
            Container(
              height: 200,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.brown.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Column(
                children: [
                  Text(
                    "Before Suger Level : ${widget.beforeGlucose}",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "After Suger Level : ${widget.afterGlucose}",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              )),
            ),

            // Go Back button
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              child: InkResponse(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(6)),
                  child: const Center(
                    child: Text(
                      "Go Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
