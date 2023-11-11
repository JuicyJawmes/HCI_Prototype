import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppPoints.dart';
import 'PointsManager.dart';

class SelectAppsScreen extends StatefulWidget {
  @override
  _SelectAppsScreenState createState() => _SelectAppsScreenState();
}

class _SelectAppsScreenState extends State<SelectAppsScreen> {
  List<String> apps = [
    'WhatsApp',
    'Messenger',
    'Outlook',
    'Discord',
    'Slack',
    'Facebook',
    'Instagram',
    'Twitter',
    'Snapchat',
    'LinkedIn',
    'Reddit',
    'TikTok',
    'Telegram',
    'Phone',
    'AppStore',
    'Handshake',
    'Blackboard',
    'Settings',
  ];

  Map<String, bool> appSelected = {};

  @override
  void initState() {
    super.initState();
    _loadSavedSelections();
  }

  Future<void> _loadSavedSelections() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      apps.forEach((app) {
        appSelected[app] = prefs.getBool(app) ?? false;
      });
    });
  }

  void onAppSelected(String app, bool isSelected) {
    setState(() {
      appSelected[app] = isSelected;
    });
    _saveSelection(app, isSelected);
    final pointsManager = Provider.of<PointsManager>(context, listen: false);

    if (appsPoints.containsKey(app)) {
      final points = appsPoints[app]!;
      if (isSelected) {
        pointsManager.addPoints(points);
      } else {
        // Subtract points if an app is deselected
        pointsManager.addPoints(-points);
      }
    }
  }

  Future<void> _saveSelection(String app, bool isSelected) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(app, isSelected);
    // If you need to do any additional actions after saving, you can do it here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar configuration
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Your Text widgets and SizedBoxes...
            Expanded(
              child: ListView.builder(
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  String app = apps[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        activeColor: Colors.blue,
                        value: appSelected[app],
                        onChanged: (value) {
                          if (value != null) {
                            onAppSelected(app, value);
                          }
                        },
                      ),
                      title: Text(app),
                    ),
                  );
                },
              ),
            ),
            Divider(thickness: 1.5),
            // Your bottom Row with IconButtons...
          ],
        ),
      ),
    );
  }
}
