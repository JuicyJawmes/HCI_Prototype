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
import 'AppLogin.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PointsManager(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),  // Ensure this is imported or defined
      routes: {
        'LoginScreen':(context ) => LoginScreen(),
        'RewardsScreen':(context )=> RewardsScreen(),
        'ConfigScreen': (context) => ConfigScreen(),
        'SelectAppsScreen': (context) => SelectAppsScreen(),
        'Rewards': (context) => Rewards(),
        'RewardsScreen':(context )=> RewardsScreen(),
        'Rewardsloginscreen': (context )=> Rewardsloginscreen(selectedSponsor: '',),
        'GiftCardScreen': (context) => GiftCardScreen(sponsorName: '', selectedPoints: 0,),
        'FriendsList': (context) => FriendsList(),
      },
    );
  }
}


class RewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pointsManager = Provider.of<PointsManager>(context);
    // Get the top 3 apps from the PointsManager
    final topApps = pointsManager.topApps;
    print('Top apps: $topApps');

    return Scaffold(
      appBar: AppBar(
        title: Text('Unwired Rewards', style: TextStyle(fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, Mark!', style: TextStyle(fontSize: 37.5)),
            SizedBox(height: 30),
            Center(
              child: Text('Weekly Usage', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Text('Top 3 Apps', style: TextStyle(fontSize: 20, decoration: TextDecoration.underline)),
          for (var entry in topApps) // Iterate over the topApps list
        Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(entry.key, style: TextStyle(fontSize: 18)),
    Text('${entry.value} Hrs', style: TextStyle(fontSize: 18, color: appsDeductPoints.containsKey(entry.key) ? Colors.red : Colors.green)),
                  ],
                ),
        ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Points Earned ', style: TextStyle(fontSize: 20)),
                    Text('${pointsManager.pointsEarned}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
                Column(
                  children: [
                    Text('Points Lost', style: TextStyle(fontSize: 18)),
                    Text('${pointsManager.pointsLost}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
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
                    icon: Icons.people,
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
