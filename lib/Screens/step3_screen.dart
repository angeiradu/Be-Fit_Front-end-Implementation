// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Step3Screen extends StatefulWidget {
  @override
  _Step3ScreenState createState() => _Step3ScreenState();
}

class _Step3ScreenState extends State<Step3Screen> {
  String selectedGender = 'Male'; // Default selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Step 3 of 3',
          style: TextStyle(color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: const Text(
              'Personal Details',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                const SizedBox(height: 80.0),
                _buildLevelInput('Birth Day'),
                const SizedBox(height: 20.0),
                _buildLevelInput('Height'),
                const SizedBox(height: 20.0),
                _buildLevelInput('Weight'),
                const SizedBox(height: 10.0),
                Container(
                  height: 40.0,
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gender',
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedGender = 'Male';
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                selectedGender == 'Male' ? Colors.teal : Colors.white,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                selectedGender == 'Male' ? Colors.white : Colors.teal,
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(color: Colors.teal),
                                ),
                              ),
                            ),
                            child: const Text('Male'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedGender = 'Female';
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                selectedGender == 'Female' ? Colors.teal : Colors.white,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                selectedGender == 'Female' ? Colors.white : Colors.teal,
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(color: Colors.teal),
                                ),
                              ),
                            ),
                            child: const Text('Female'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF008080),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Finish'),
                ),
              ],
            ),
          ),
          Container(
            height: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCircle(0),
                const SizedBox(width: 5.0),
                _buildCircle(1),
                const SizedBox(width: 5.0),
                _buildCircle(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(int index) {
    Color color = index == 2 ? Colors.teal : Colors.grey;
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _buildLevelInput(String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            labelStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!, width: 0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
            ),
          ),
        ),
        if (hintText == 'Weight') const SizedBox(height: 20.0),
      ],
    );
  }
}
