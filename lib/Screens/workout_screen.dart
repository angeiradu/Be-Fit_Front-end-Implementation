import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final List<Map<String, dynamic>> drawerItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard, 'route': '/dashboard'},
    {'title': 'Tips', 'icon': Icons.lightbulb_outline, 'route': '/tips'},
    {'title': 'Workout', 'icon': Icons.fitness_center, 'route': '/workout'},
    {'title': 'Meal Plan', 'icon': Icons.restaurant_menu, 'route': '/meal_plan'},
    {'title': 'Check your process', 'icon': Icons.assignment, 'route': '/check_process'},
    {'title': 'Settings', 'icon': Icons.settings, 'route': '/settings'},
    {'title': 'Support', 'icon': Icons.support_agent, 'route': '/support'},
  ];

  String _currentItemSelected = 'Workout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Workout',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
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
          color: Color(0xFF557E7E),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
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
                Divider(color: Colors.white),
                Expanded(
                  child: ListView.builder(
                    itemCount: drawerItems.length,
                    itemBuilder: (context, index) {
                      var item = drawerItems[index];
                      return ListTile(
                        tileColor: _currentItemSelected == item['title'] ? Colors.blue[900] : Colors.transparent,
                        leading: Icon(item['icon'], color: Colors.white),
                        title: Text(
                          item['title'],
                          style: TextStyle(
                            color: _currentItemSelected == item['title'] ? Colors.white : Colors.white,
                            fontWeight: _currentItemSelected == item['title'] ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          if (_currentItemSelected != item['title']) {
                            Navigator.pushNamed(context, item['route']);
                          }
                        },
                      );
                    },
                  ),
                ),
                Divider(color: Colors.white),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.white),
                  title: Text(
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
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                tabs: [
                  Tab(text: 'Full Body'),
                  Tab(text: 'Foot'),
                  Tab(text: 'Arm'),
                ],
                labelColor: Colors.teal,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.teal,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.0,
                      children: [
                        for (var i = 1; i <= 6; i++)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset('assets/workout$i.png', fit: BoxFit.cover),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      color: Colors.black54,
                                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      child: Text(
                                        _getWorkoutText(i),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.play_circle_filled, size: 50, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Center(child: Text('Foot Screen')),
                  Center(child: Text('Arm Screen')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getWorkoutText(int index) {
    switch (index) {
      case 1:
        return 'Full body challenge';
      case 2:
        return 'Foot workout cha';
      case 3:
        return 'Squats';
      case 4:
        return 'Plank';
      case 5:
        return 'BODYWEIGHT';
      case 6:
        return 'Forward lunge';
      default:
        return '';
    }
  }
}