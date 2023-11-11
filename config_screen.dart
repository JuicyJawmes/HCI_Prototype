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
      appBar: AppBar(
        backgroundColor: Colors.blue, // Color for the app bar
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
                    activeColor: Colors.blue,
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
                    leading: Icon(Icons.apps, color: Colors.blue),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.compare),
                      onPressed: () {},
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Compare Usage',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.card_giftcard),
                      onPressed: () {Navigator.pushNamed(context, 'Rewards');},
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Redeem',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
