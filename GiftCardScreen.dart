import 'package:flutter/material.dart';

class GiftCardScreen extends StatelessWidget {

  final String sponsorName;
  final int selectedPoints;
  //GiftCardScreen({Key? key, required this.sponsorName}) : super(key: key);
  GiftCardScreen({Key? key, required this.sponsorName, required this.selectedPoints}) : super(key: key);

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
      body: Column(
        children: <Widget>[
          Expanded(
            // This will take all available space that's not taken by the bottom buttons.
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Unwired Rewards"),
                  Text("Sponsor: $sponsorName"), // Add this line to display the sponsor
                  Text("Points Converted: $selectedPoints"),
                  Text("Gift card#: XXXXXXXX"),
                  Text("Gift Card Redeemed!"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text("Redeem Again"),
                    onPressed: () {
                      Navigator.pushNamed(context, 'Rewards');
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
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
                          onPressed: () {
                            Navigator.pushNamed(context, 'Rewards');
                          },
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
              ])),
        ],
      ),
    );
  }
}
