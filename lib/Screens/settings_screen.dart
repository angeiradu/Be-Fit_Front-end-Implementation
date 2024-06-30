// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> drawerItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard, 'route': '/dashboard'},
    {'title': 'Tips', 'icon': Icons.lightbulb_outline, 'route': '/tips'},
    {'title': 'Workout', 'icon': Icons.fitness_center, 'route': '/workout'},
    {'title': 'Meal Plan', 'icon': Icons.restaurant_menu, 'route': '/meal_plan'},
    {'title': 'Check your process', 'icon': Icons.assignment, 'route': '/check_process'},
    {'title': 'Settings', 'icon': Icons.settings, 'route': '/settings'},
    {'title': 'Support', 'icon': Icons.support_agent, 'route': '/support'},
  ];

  String _currentItemSelected = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings', // Ensure 'Settings' title is set here
          style: TextStyle(
            color: Colors.white, // Set text color to white
          ),
        ),
        centerTitle: true, // Center aligns the title horizontally
        backgroundColor: Colors.teal, // Set the app bar background color to teal
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white, // Set the hamburger icon color to white
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: drawerItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(drawerItems[index]['icon'], color: Colors.white),
                      title: Text(
                        drawerItems[index]['title'],
                        style: TextStyle(
                          color: _currentItemSelected == drawerItems[index]['title'] ? Colors.blue[900] : Colors.white,
                          fontWeight: _currentItemSelected == drawerItems[index]['title'] ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context); 
                        if (_currentItemSelected != drawerItems[index]['title']) {
                          Navigator.pushNamed(context, drawerItems[index]['route']);
                        }
                      },
                    );
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.assignment_turned_in_outlined),
            title: const Text('Reminders'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              // Handle tap
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              // Handle tap
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy checkup'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              // Handle tap
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Status Update'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              // Handle tap
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Reset password'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              // Handle tap
            },
          ),
        ],
      ),
    );
  }
}
