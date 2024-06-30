// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> drawerItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard, 'route': '/dashboard'},
    {'title': 'Tips', 'icon': Icons.lightbulb_outline, 'route': '/tips'},
    {'title': 'Workout', 'icon': Icons.fitness_center, 'route': '/workout'},
    {'title': 'Meal Plan', 'icon': Icons.restaurant_menu, 'route': '/meal_plan'},
    {'title': 'Check your process', 'icon': Icons.assignment, 'route': '/check_process'},
    {'title': 'Settings', 'icon': Icons.settings, 'route': '/settings'},
    {'title': 'Support', 'icon': Icons.support_agent, 'route': '/support'},
  ];

  String _currentItemSelected = 'Tips';

  final List<Map<String, dynamic>> tipsList = [
    {'image': 'assets/tips1.png', 'text': 'Set clear goals'},
    {'image': 'assets/tips2.png', 'text': 'Create a Schedule'},
    {'image': 'assets/tips3.png', 'text': 'Mix up workouts'},
    {'image': 'assets/tips4.png', 'text': 'Start with warm-ups'},
    {'image': 'assets/tips5.png', 'text': 'Rest and recover'},
    {'image': 'assets/tips6.png', 'text': 'Stay hydrated'},
    {'image': 'assets/tips7.png', 'text': 'Rest and recover'},
    {'image': 'assets/tips8.png', 'text': 'Stay hydrated'},
  ];

  TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tips',
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
                      Navigator.pop(context); // Close the drawer first
                      if (_currentItemSelected != item['title']) {
                        Navigator.pushNamed(context, item['route']); // Navigate to the selected route
                      }
                    },
                  ),
                const SizedBox(height: 16.0),
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text(
                'Tips',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.05, // Adjust this value to reduce card height
              ),
              itemCount: tipsList.length,
              itemBuilder: (context, index) {
                return _buildTipCard(tipsList[index]['image'], tipsList[index]['text']);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(String imagePath, String text) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Ink.image(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  // Handle tap on the card
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

