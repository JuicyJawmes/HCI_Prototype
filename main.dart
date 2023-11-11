import 'package:flutter/material.dart';
import 'config_screen.dart';
import 'SelectAppsScreen.dart';
import 'Rewards.dart';
import 'Rewardsloginscreen.dart';
import 'GiftCardScreen.dart';
import 'FriendsList.dart';
import 'PointsManager.dart';
import 'package:provider/provider.dart';
import 'AppPoints.dart';

//void main() => runApp(MyApp());
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PointsManager(),
      child: MyApp(),
    ),
  );
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await PointsManager.init();
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RewardsScreen(),  // Ensure this is imported or defined
      routes: {
        'ConfigScreen': (context) => ConfigScreen(),
        'SelectAppsScreen': (context) => SelectAppsScreen(),
        'Rewards': (context) => Rewards(),
        'RewardsScreen':(context )=> RewardsScreen(),
        'Rewardsloginscreen': (context )=> Rewardsloginscreen(),
        'GiftCardScreen': (context) => GiftCardScreen(),
        'FriendsList': (context) => FriendsList(),
      },
    );
  }
}


class RewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unwired Rewards', style: TextStyle(fontSize: 25)), // 1.25x of 20
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // 1.25x of 16
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, Mark!', style: TextStyle(fontSize: 37.5)), // 1.25x of 30
            SizedBox(height: 50), // 1.25x of 40
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 40,
                      color: Colors.red,
                    ),
                    Text('10/04', style: TextStyle(fontSize: 22.5)), // 1.25x of 18
                    SizedBox(height: 25), // 1.25x of 20
                    Text('Phone Usage', style: TextStyle(fontSize: 20)), // 1.25x of 16
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 40,
                      color: Colors.green,
                    ),
                    Text('10/05', style: TextStyle(fontSize: 22.5)), // 1.25x of 18
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 120,
                      width: 40,
                      color: Colors.red,
                    ),
                    Text('10/04', style: TextStyle(fontSize: 22.5)), // 1.25x of 18
                    SizedBox(height: 25), // 1.25x of 20
                    Text('Points Earned', style: TextStyle(fontSize: 20)), // 1.25x of 16
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 120,
                      width: 40,
                      color: Colors.green,
                    ),
                    Text('10/05', style: TextStyle(fontSize: 22.5)), // 1.25x of 18
                  ],
                ),
              ],
            ),
            SizedBox(height: 50), // 1.25x of 40
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 12.5), // Adding vertical padding of 12.5 for each item
                children: [
                  MenuButton(
                    icon: Icons.settings,
                    text: 'Configure App',
                    onPressed: () { Navigator.pushNamed(context, 'ConfigScreen');
                    },
                  ),
                  MenuButton(
                    icon: Icons.compare,
                    text: 'Compare Usage',
                    onPressed: () { Navigator.pushNamed(context, 'FriendsList');
                    },
                  ),
                  MenuButton(
                    icon: Icons.card_giftcard,
                    text: 'Redeem Points',
                    onPressed: () { Navigator.pushNamed(context, 'Rewards');},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;

  MenuButton({required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(12.5), // Adding 12.5 padding to each ListTile
      leading: Icon(icon, size: 35), // 1.25x of 28
      title: Text(text, style: TextStyle(fontSize: 25)), // 1.25x of 20
      onTap: onPressed as void Function()?,
    );
  }
}
