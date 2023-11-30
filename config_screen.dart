import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigScreen extends StatefulWidget {
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  bool _notificationsOn = true;
  String _notificationType = 'Vibration';
  String _notificationFrequency = '10 minutes';


  void _showSnackBar(String message, Color backgroundColor) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsOn = prefs.getBool('notificationsOn') ?? true;
      _notificationType = prefs.getString('notificationType') ?? 'Vibration';
      _notificationFrequency = prefs.getString('notificationFrequency') ?? '10 minutes';
    });
  }

  _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('notificationsOn', _notificationsOn);
    prefs.setString('notificationType', _notificationType);
    prefs.setString('notificationFrequency', _notificationFrequency);
  }

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
              Navigator.pushNamed(context, 'RewardsScreen');
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
                        _savePreferences();
                        _showSnackBar(
                        _notificationsOn ? "Notifications turned on" : "Notifications turned off",
                        _notificationsOn ? Colors.green : Colors.red, // Green when on, red when off
                        );
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  SizedBox(height: 16.0),
                  Text('Notification Type:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  DropdownButton<String>(
                    value: _notificationType,
                    items: ['Vibration', 'Ring','Silent',].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _notificationType = value!;
                        _savePreferences();
                        _showSnackBar("Notification type set to $_notificationType", Colors.green); // Green snackbar
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text('Notification Frequency:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  DropdownButton<String>(
                    value: _notificationFrequency,
                    items: ['10 minutes', '15 minutes', '30 minutes', '1 hour'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _notificationFrequency = value!;
                        _savePreferences();
                        _showSnackBar("Notification frequency set to $_notificationFrequency", Colors.green); // Green snackbar
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  ListTile(
                    leading: Icon(Icons.apps, color: Colors.blue),
                    title: Text('Select Applications for Monitoring', style: TextStyle(fontSize: 16)),
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
                      icon: Icon(Icons.people),
                      onPressed: () {Navigator.pushNamed(context, 'FriendsList');},
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
