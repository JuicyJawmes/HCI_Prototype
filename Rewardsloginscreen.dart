import 'package:flutter/material.dart';

class Rewardsloginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed (context, 'RewardsScreen'); // Replace with your home route name
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 100.0,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'email:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'password:',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'GiftCardScreen');
// Logic for generating and emailing the gift card
              },
              child: Text('Generate Gift Card!'),
            ),
            Spacer(),
            Divider(thickness: 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.pushNamed(context, 'ConfigScreen');
                      },
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
