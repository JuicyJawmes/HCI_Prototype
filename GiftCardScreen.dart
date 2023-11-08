import 'package:flutter/material.dart' show AppBar, BottomNavigationBar, BottomNavigationBarItem, BuildContext, Center, Column, ElevatedButton, Icon, IconButton, Icons, MainAxisAlignment, Navigator, Scaffold, SizedBox, StatelessWidget, Text, Widget;

class GiftCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate Gift Card"),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, 'RewardsScreen');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Unwired Rewards"),
            Text("Gift card#: XXXXXXXX"),
            Text("Gift Card Redeemed!"),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Return to Home"),
              onPressed: () {
                Navigator.pushNamed(context, 'RewardsScreen');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare),
            label: "TBD",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Rewards",
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, 'ConfigScreen');
              break;
            case 1:
            // Add navigation logic for TBD screen when available
              break;
            case 2:
              Navigator.pushNamed(context, 'Rewards');
              break;
          }
        },
      ),
    );
  }
}
