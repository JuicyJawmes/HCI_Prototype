import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  bool _notificationsOn = true;
  String _notificationType = 'Vibration';
  String _notificationFrequency = '10 minutes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Background color for the entire screen
      appBar: AppBar(
        backgroundColor: Colors.teal, // Color for the app bar
        title: Text('App Configurations'),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Text('Notifications:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Switch(
                    value: _notificationsOn,
                    onChanged: (bool value) {
                      setState(() {
                        _notificationsOn = value;
                      });
                    },
                    activeColor: Colors.teal,
                  ),
                  SizedBox(height: 16.0),
                  Text('Notification Type:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  DropdownButton<String>(
                    value: _notificationType,
                    items: ['Vibration', 'Ring'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _notificationType = value!;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text('Notification Frequency:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  DropdownButton<String>(
                    value: _notificationFrequency,
                    items: ['10 minutes', '15 minutes', '30 minutes', '1 hr'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _notificationFrequency = value!;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  ListTile(
                    leading: Icon(Icons.apps, color: Colors.teal),
                    title: Text('Choose your own essential + non-essential apps:', style: TextStyle(fontSize: 16)),
                    onTap: () {
                      Navigator.pushNamed(context, 'SelectAppsScreen');
                    },
                  ),
                ],
              ),
            ),
            Divider(thickness: 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, color: Colors.teal),
                  onPressed: () {
                    Navigator.pushNamed(context, 'RewardsScreen');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.compare, color: Colors.teal),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.card_giftcard, color: Colors.teal),
                  onPressed: () {Navigator.pushNamed(context, 'Rewards');},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
