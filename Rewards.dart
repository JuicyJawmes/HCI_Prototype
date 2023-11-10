import 'package:flutter/material.dart';
class Rewards extends StatefulWidget {
  @override
  _RewardsState createState() => _RewardsState();
}
class _RewardsState extends State<Rewards> {
  String _selectedSponsor = 'amazon';
  int _selectedPoints = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redeem Rewards"),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context); // Navigate back
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Unwired Rewards', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Current Balance:', style: TextStyle(fontSize: 18)),
            Text('785 pts', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Column(
              children: [
                _buildRewardConversion(100, '\$1.00'),
                _buildRewardConversion(250, '\$4.00'),
                _buildRewardConversion(500, '\$9.00'),
                _buildRewardConversion(1000, '\$20.00'),
              ],
            ),
            SizedBox(height: 20),
            Text('Sponsor:', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedSponsor,
              items: ["amazon", "bestbuy", "playstore", "target"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSponsor = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Convert Points:', style: TextStyle(fontSize: 18)),
            DropdownButton<int>(
              value: _selectedPoints,
              items: [100, 250, 500, 1000].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPoints = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'Rewardsloginscreen');              // Navigate to login screen
              },
              child: Text('Login to Collect Rewards'),
            ),
            Spacer(),
            Divider(thickness: 1.5), // begin bottom row of buttons
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
                        onPressed: () {},
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
  Widget _buildRewardConversion(int points, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$points pts'),
        Text(' = '),
        Text(value),
      ],
    );
  }
}
