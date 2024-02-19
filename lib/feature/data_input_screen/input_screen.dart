import 'package:blood_sugar_monitor/feature/data_input_screen/widgets/app_bar_widget.dart';
import 'package:blood_sugar_monitor/feature/show_information_screen/information_screen.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();

  String _beforeGlucose = '';
  String _afterGlucose = '';

  _submitData(beforeGlucose, afterGlucose) {
    final bool? isValid = _formKey.currentState?.validate();

    if (isValid == true) {
      debugPrint("Everything is good");
      debugPrint(_beforeGlucose);
      debugPrint(_afterGlucose);
      /* 
      Continute proccessing the provided information with your own logic 
      such us sending HTTP requests, savaing to SQLite database, etc.
      */

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InformationScreen(
            beforeGlucose: _beforeGlucose,
            afterGlucose: _afterGlucose,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.brown.shade300,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // App bar
                const AppBarWidget(name: "Sugar Monitor"),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Before glucose value
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 50,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Before Glucose Level",
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your before glucose level';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            _beforeGlucose = value;
                          },
                        ),
                      ),
                      // After Glucose value
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 50,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "After Glucose Level",
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your after glucose level';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            _afterGlucose = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Show Info Button
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 30,
                  ),
                  child: InkResponse(
                    onTap: () {
                      _submitData(_beforeGlucose, _afterGlucose);
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(6)),
                      child: const Center(
                        child: Text(
                          "Show Info",
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
        ),
      ),
    );
  }
}
