import 'package:flutter/material.dart' show AppBar, BottomAppBar, BuildContext, Column, CrossAxisAlignment, EdgeInsets, ElevatedButton, Icon, IconButton, Icons, InputDecoration, MainAxisAlignment, Navigator, OutlineInputBorder, Padding, Row, Scaffold, SizedBox, StatelessWidget, Text, TextField, Widget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'GiftCardScreen.dart';
import 'PointsManager.dart';
import 'Rewards.dart';

class Rewardsloginscreen extends StatefulWidget {

  final String selectedSponsor;
  final int selectedPoints; // Add this line if you pass selectedPoints through constructor
  Rewardsloginscreen({Key? key, this.selectedPoints = 0, required this.selectedSponsor}) : super(key: key); // Modify the constructor accordingly

  @override
  _RewardsLoginScreenState createState() => _RewardsLoginScreenState();
}

class _RewardsLoginScreenState extends State<Rewardsloginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Check the credentials
    if (email == 'HCI@utdallas.edu' && password == 'HCI_Rocks!') {
      setState(() {
        _isLoggedIn = true;

      });
      // You might want to navigate the user to the next screen or perform some other actions here.
    } else {
      setState(() {
        _isLoggedIn = false;
      });
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email or password.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, 'RewardsScreen'); // Replace with your home route name
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
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password:',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            // Changed the onPressed condition to check if _isLoggedIn is true
            SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: _isLoggedIn ? () async {
                bool canRedeem = await Provider.of<PointsManager>(context, listen: false).canRedeemPoints(widget.selectedPoints);
                if (canRedeem) {
                  Provider.of<PointsManager>(context, listen: false).redeemPoints(widget.selectedPoints);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GiftCardScreen(sponsorName: widget.selectedSponsor, selectedPoints: widget.selectedPoints),
                    ),
                  );
                } else {
                  // existing code...
                }
              }
              :null,
              child: Text('Generate Gift Card'),
              // onPressed: _isLoggedIn
              //     ? () async {
              //   // Call redeemPoints from PointsManager
              //   await Provider.of<PointsManager>(context, listen: false).redeemPoints(widget.selectedPoints);
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => GiftCardScreen(sponsorName: widget.selectedSponsor,),
              //     ),
              //   );
              //
              //     // If redeeming points was successful, do something, like navigate
              //     //Navigator.pushNamed(context, 'GiftCardScreen');
              // }
              //     : null, // Button is disabled when _isLoggedIn is false
              // child: Text('Generate Gift Card'),
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
              icon: Icon(Icons.people),
              onPressed: () {Navigator.pushNamed(context, 'FriendsList');
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
