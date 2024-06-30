// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Step2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Step 2 of 3',
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
              'Select your fitness level',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
                const SizedBox(width: 35.0),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                const SizedBox(height: 80.0),
                _buildLevelInput('Beginner'),
                const SizedBox(height: 20.0),
                _buildLevelInput('Intermediate'),
                const SizedBox(height: 20.0),
                _buildLevelInput('Advanced'),
                const SizedBox(height: 80.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/step3');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF008080),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Next'),
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
    Color color = index == 1 ? Colors.teal : Colors.grey;
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _buildLevelInput(String level) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          level,
          style: const TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
        const SizedBox(height: 4.0),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Enter details for $level level',
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!), 
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal), 
            ),
          ),
        ),
      ],
    );
  }
}
