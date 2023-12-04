import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppPoints.dart';

class PointsManager with ChangeNotifier {
  int _currentPoints = 785; // Default starting points
  int _pointsEarned = 0;
  int _pointsLost = 0;

  Map<String, bool> _selectedApps = {};

  int get currentPoints => _currentPoints;
  int get pointsEarned => _pointsEarned;
  int get pointsLost => _pointsLost;
  Map<String, bool> get selectedApps => _selectedApps;

  Map<String, int> appUsageHours = {
    'WhatsApp': 10,
    'Messenger': 5,
    'Outlook': 4,
    'Discord': 30,
    'Slack': 5,
    'LinkedIn': 6,
    'Reddit': 8,
    'Telegram': 10,
    'Phone': 3,
    'AppStore': 2,
    'Handshake': 15,
    'Blackboard': 15,
    'Settings': 5,
    'Facebook': 10,
    'Instagram': 14,
    'Netflix': 10,
    'Youtube': 12,
    'DisneyPlus': 10,
    'Twitter': 10,
    'Snapchat': 6,
    'TikTok': 10,
    // ... other apps ...
  };
  List<MapEntry<String, int>>get topApps {
    var sortedApps = appUsageHours.entries
        .where((entry) => _selectedApps[entry.key] ?? false) // Filter only selected apps
        .toList();
    sortedApps.sort((a, b) => b.value.compareTo(a.value)); // Sort in descending order of usage hours
    return sortedApps.take(3).toList(); // Take the top 3 apps

  }
  PointsManager() {
    _loadData();
  }


  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _currentPoints = prefs.getInt('current_balance') ?? _currentPoints;
    _pointsEarned = prefs.getInt('points_earned') ?? 0;
    _pointsLost = prefs.getInt('points_lost') ?? 0;
    List<String>? savedApps = prefs.getStringList('selected_apps');

    _selectedApps = {
      for (var app in savedApps ?? []) app: true,
    };
    //print('Loaded selected apps: $_selectedApps');
    notifyListeners();
  }

  void updateAppSelection(String app, bool isSelected) {
    // Handle selection changes
    _selectedApps[app] = isSelected;
    if (isSelected) {
      if (appsPoints.containsKey(app)) {
        _pointsEarned += appsPoints[app]!;
        _currentPoints += appsPoints[app]!;
      } else if (appsDeductPoints.containsKey(app)) {
        _pointsLost += appsDeductPoints[app]!;
        _currentPoints -= appsDeductPoints[app]!;
      }
    }
    notifyListeners();
    _saveData();

  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    // Save points data and selected apps
    await prefs.setInt('current_balance', _currentPoints);
    await prefs.setInt('points_earned', _pointsEarned);
    await prefs.setInt('points_lost', _pointsLost);
    await prefs.setStringList('selected_apps', _selectedApps.keys.toList());
    notifyListeners();
  }

  // Redeem points for rewards
  Future<bool> redeemPoints(int pointsToDeduct) async {
    print('redeemPoints called with $pointsToDeduct');
    if (_currentPoints >= pointsToDeduct) {
      _currentPoints -= pointsToDeduct; // Deduct the points
      print('Current points after deduction: $_currentPoints');
      await _saveData(); // Save the updated points to SharedPreferences
      notifyListeners(); // Notify any listeners to update the UI
      return true; // Indicate the redemption was successful
    }
    return false; // Indicate the redemption was unsuccessful due to insufficient points
  }

  // Check if user has enough points to redeem
  Future<bool> canRedeemPoints(int pointsToRedeem) async {
    return _currentPoints >= pointsToRedeem;
  }
}

