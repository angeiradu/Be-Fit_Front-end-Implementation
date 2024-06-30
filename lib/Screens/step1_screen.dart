// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Step1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Step 1 of 3',
          style: TextStyle(color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset(
                  'assets/fitness.png', 
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome to',
                        style: TextStyle(fontSize: 24.0, color: Colors.grey),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Be Fit Application',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                      const SizedBox(height: 15.0),
                      const Text(
                        'Personalized workouts will help you gain strength, get in better shape, and embrace a healthy lifestyle',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      const SizedBox(height: 40.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/step2');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF008080),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                        ),
                        child: const Text('Get Started'),
                      ),
                    ],
                  ),
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
    Color color = index == 0 ? Colors.teal : Colors.grey;
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
