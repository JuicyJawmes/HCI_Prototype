import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FriendsList extends StatefulWidget {
  @override
  FriendsListState createState() => FriendsListState();
}

class FriendsListState extends State<FriendsList> {
  Map<String, int> potentialFriends = {
    'Ayush': 18,
    'Yatharth': 20,
    'Ashish': 8,
    'Eddie': 42,
    'Alice': 3,
    'Bob': 5,
    'Charlie': 7,
    'Diana': 2,
  }; // Hardcoded array of potential friends with hours

  Map<String, int> currentFriends = {
    'James': 12,
    'Mahdi': 4,
    'Colby': 25,

  }; // Initial friends with hours

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  _saveFriends() async {
    final prefs = await SharedPreferences.getInstance();
    String encodedData = json.encode(currentFriends);
    await prefs.setString('currentFriends', encodedData);
  }

  _loadFriends() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedFriendsString = prefs.getString('currentFriends');
    if (savedFriendsString != null) {
      setState(() {
        currentFriends = Map<String, int>.from(
            json.decode(savedFriendsString).map(
                    (key, value) => MapEntry(key, value is int ? value : int.tryParse(value.toString()) ?? 0)
            )
        );
      });
    }
  }


  void addFriend(String friend) {
    if (!currentFriends.containsKey(friend)) {
      setState(() {
        currentFriends[friend] = potentialFriends[friend]!;
        _saveFriends();
      });
    }
  }

  void removeFriend(String friend) {
    setState(() {
      currentFriends.remove(friend);
      _saveFriends();
    });
  }

  void _showAddFriendDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a Friend'),
          content: SingleChildScrollView(
            child: ListBody(
              children: potentialFriends.keys.map((friend) {
                return ListTile(
                  title: Text(friend),
                  onTap: () {
                    addFriend(friend);
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _showRemoveFriendDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove a Friend'),
          content: SingleChildScrollView(
            child: ListBody(
              children: currentFriends.keys.map((friend) {
                return ListTile(
                  title: Text(friend),
                  onTap: () {
                    removeFriend(friend);
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unwired Rewards"),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Friend's Stats:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.person_add),
                  label: Text('Add Friend'),
                  onPressed: _showAddFriendDialog,
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.person_remove),
                  label: Text('Remove Friend'),
                  onPressed: _showRemoveFriendDialog,
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: currentFriends.length,
              itemBuilder: (context, index) {
                String friendName = currentFriends.keys.elementAt(index);
                int hours = currentFriends.values.elementAt(index);
                return ListTile(
                  title: Text(friendName),
                  trailing: Text('$hours Hrs'),
                );
              },
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
