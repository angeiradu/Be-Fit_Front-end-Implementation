// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MealPlanScreen extends StatelessWidget {
  final List<Map<String, dynamic>> drawerItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard, 'route': '/dashboard'},
    {'title': 'Tips', 'icon': Icons.lightbulb_outline, 'route': '/tips'},
    {'title': 'Workout', 'icon': Icons.fitness_center, 'route': '/workout'},
    {'title': 'Meal Plan', 'icon': Icons.restaurant_menu, 'route': '/meal_plan'},
    {'title': 'Check your process', 'icon': Icons.assignment, 'route': '/check_process'},
    {'title': 'Settings', 'icon': Icons.settings, 'route': '/settings'},
    {'title': 'Support', 'icon': Icons.support_agent, 'route': '/support'},
  ];

  String _currentItemSelected = 'Meal Plan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meal Plan',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF557E7E),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 28.0,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      SizedBox(width: 8.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IRADUKUNDA Ange',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Online',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white),
                for (var item in drawerItems)
                  ListTile(
                    leading: Icon(item['icon'], color: Colors.white),
                    title: Text(
                      item['title'],
                      style: TextStyle(
                        color: _currentItemSelected == item['title'] ? Colors.blue[900] : Colors.white,
                        fontWeight: _currentItemSelected == item['title'] ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      if (_currentItemSelected != item['title']) {
                        Navigator.pushNamed(context, item['route']);
                      }
                    },
                  ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Divider(color: Colors.white),
                        ListTile(
                          leading: const Icon(Icons.exit_to_app, color: Colors.white),
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () {
                            // Handle logout logic
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Sunday, AUG 26',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                _showImageDialog(context, 'assets/meal1.png');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  'assets/meal1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            InkWell(
              onTap: () {
                _showImageDialog(context, 'assets/meal2.png');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  'assets/meal2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            InkWell(
              onTap: () {
                _showImageDialog(context, 'assets/meal3.png');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  'assets/meal3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
