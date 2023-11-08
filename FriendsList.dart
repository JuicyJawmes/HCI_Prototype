import 'package:flutter/material.dart';

class FriendsList extends StatefulWidget {
  @override
  FriendsListState createState() => FriendsListState();
}

class FriendsListState extends State<FriendsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend's Status"),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.black),
            onPressed: () { Navigator.pushNamed(context, 'RewardsScreen');},
            // Handle the action for the home icon
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () { Navigator.pop(context);},
              ),
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Unwired Rewards',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Friend's Stats:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text('You'),
            trailing: Text('12 Hrs'),
          ),
          ListTile(
            title: Text('Mahdi'),
            trailing: Text('4 Hrs'),
          ),
          ListTile(
            title: Text('James'),
            trailing: Text('27 Hrs'),
          ),
          ListTile(
            title: Text('Colby'),
            trailing: Text('25 Hrs'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Most Used App:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // ... Similarly for the most used app section
          // Then for the buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Add a Friend'),
                  onPressed: () {
                    // Handle add friend
                  },
                ),
                TextButton.icon(
                  icon: Icon(Icons.delete),
                  label: Text('Remove'),
                  onPressed: () {
                    // Handle remove
                  },
                ),
              ],
            ),
          ),
          Divider(),
          // Footer icons, similar to app bar actions
        ],
      ),
    );
  }
}