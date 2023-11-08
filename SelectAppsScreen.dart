import 'package:flutter/material.dart';

class SelectAppsScreen extends StatefulWidget {
  @override
  _SelectAppsScreenState createState() => _SelectAppsScreenState();
}

class _SelectAppsScreenState extends State<SelectAppsScreen> {
  List<String> apps = [
    'WhatsApp',
    'Messenger',
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
    // Add more apps here as needed
  ];

  Map<String, bool> appSelected = {};

  @override
  void initState() {
    super.initState();
    apps.forEach((app) {
      appSelected[app] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Unwired Rewards"),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'GAIN or LOSE points depending on the app you use daily!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Select Essential Apps',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        activeColor: Colors.pink[300],
                        value: appSelected[apps[index]],
                        onChanged: (value) {
                          setState(() {
                            appSelected[apps[index]] = value!;
                          });
                        },
                      ),
                      title: Text(apps[index]),
                    ),
                  );
                },
              ),
            ),
            Divider(thickness: 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, color: Colors.teal),
                  onPressed: () {
                    Navigator.pushNamed(context, 'RewardsScreen'); // Replace with your navigation or action logic
                        ;                  },
                ),
                IconButton(
                  icon: Icon(Icons.compare, color: Colors.teal),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.card_giftcard, color: Colors.teal),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
