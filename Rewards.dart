import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PointsManager.dart';
import 'Rewardsloginscreen.dart';

class Rewards extends StatefulWidget {
  @override
  _RewardsState createState() => _RewardsState();
}
class _RewardsState extends State<Rewards> {
  String _selectedSponsor = 'Amazon';
  int _selectedPoints = 100;

  @override
  Widget build(BuildContext context) {
    final pointsManager = Provider.of<PointsManager>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Redeem Rewards"),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, 'RewardsScreen');; // Navigate back
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
      Consumer<PointsManager>(
      builder: (context, pointsManager, child) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Current Balance:', style: TextStyle(fontSize: 18)),
      Text('${pointsManager.currentPoints} pts', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //Text("Selected Sponsor: $_selectedSponsor"),
              ],
    ),
    ),
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
              items: ["Amazon", "Bestbuy", "Playstore", "Target"].map((String value) {
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
              onPressed: () async {
                // Check if the user can redeem points and get the success status
                bool canRedeem = await Provider.of<PointsManager>(context, listen: false).canRedeemPoints(_selectedPoints);
                if (canRedeem) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Rewardsloginscreen(selectedPoints: _selectedPoints, selectedSponsor: _selectedSponsor),
                    ),
                  );
                } else {
                  // If not enough points, show a snackbar or some alert to the user
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Not enough points to redeem this reward.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
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
