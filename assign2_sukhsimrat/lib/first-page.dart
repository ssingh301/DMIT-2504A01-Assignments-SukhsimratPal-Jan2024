// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Enable Buttons'),
              Switch(
                value: enabled,
                onChanged: (bool value) {
                  setState(() {
                    enabled = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timesClicked++;
                      msg1 = 'Clicked $timesClicked';
                    });
                  },
                  child: Text("Click ${timesClicked == 0 ? '' : msg1}"),
                ),
              ),
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timesClicked = 0;
                    });
                  },
                  child: Text('Reset'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      labelText: 'first name',
                      icon: Icon(Icons.hourglass_top),
                      helperText: 'min 1, max 10',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      counterText: '${textEditingController.text.length}/10',
                      suffixIcon: const Icon(Icons.check_circle),
                    ),
                    maxLength: 10,
                    validator: (value) {
                      return value!.isEmpty
                          ? 'First name must be at least 1 character'
                          : null;
                    },
                    onSaved: (value) {
                      firstName = value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              MySnackBar(
                                text: '🤍 Hey There, Your Name is ${textEditingController.text}',
                              ).createSnackBar(),
                            );
                            textEditingController.clear();
                          } else {
                            setState(() {});
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}