import 'package:flutter/material.dart' show AppBar, BottomAppBar, BuildContext, Column, CrossAxisAlignment, EdgeInsets, ElevatedButton, Icon, IconButton, Icons, InputDecoration, MainAxisAlignment, Navigator, OutlineInputBorder, Padding, Row, Scaffold, SizedBox, StatelessWidget, Text, TextField, Widget;

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
              child: Text('Generate and email Gift Card'),
            ),


          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, 'ConfigScreen');
              },
            ),
            IconButton(
              icon: Icon(Icons.compare),
              onPressed: () {
                // Logic for TBD
              },
            ),
            IconButton(
              icon: Icon(Icons.card_giftcard),
              onPressed: () {
                Navigator.pushNamed(context, 'Rewards');
              },
            ),
          ],
        ),
      ),
    );
  }
}
