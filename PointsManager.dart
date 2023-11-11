import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PointsManager with ChangeNotifier {
  int _currentPoints = 785; // Default starting points
  Map<String, bool> _selectedApps = {};

  int get currentPoints => _currentPoints;
  Map<String, bool> get selectedApps => _selectedApps;

  PointsManager() {
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _currentPoints = prefs.getInt('current_balance') ?? _currentPoints;
    // Load the selected apps
    List<String>? selectedAppsList = prefs.getStringList('selected_apps');
    _selectedApps = {
      for (var app in selectedAppsList ?? []) app: true,
    };
    notifyListeners();
  }

  void updateAppSelection(String app, bool isSelected) {
    _selectedApps[app] = isSelected;
    _saveAppSelection();
    notifyListeners();
  }

  void _saveAppSelection() async {
    final prefs = await SharedPreferences.getInstance();
    // Save the selected apps
    List<String> selectedAppsKeys = _selectedApps.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();
    await prefs.setStringList('selected_apps', selectedAppsKeys);
  }

  void addPoints(int pointsToAdd) async {
    final prefs = await SharedPreferences.getInstance();
    _currentPoints = (_currentPoints + pointsToAdd).clamp(0, double.infinity).toInt();
    await prefs.setInt('current_balance', _currentPoints);
    notifyListeners();
  }

  Future<bool> canRedeemPoints(int pointsToRedeem) async {
    final prefs = await SharedPreferences.getInstance();
    int currentBalance = prefs.getInt('current_balance') ?? _currentPoints;

    // Check if the current balance is enough for the redemption
    return currentBalance >= pointsToRedeem;
  }

  Future<bool> redeemPoints(int pointsToDeduct) async {
    final prefs = await SharedPreferences.getInstance();
    int currentBalance = prefs.getInt('current_balance') ?? _currentPoints;

    if (currentBalance >= pointsToDeduct) {
      _currentPoints = currentBalance - pointsToDeduct;
      await prefs.setInt('current_balance', _currentPoints);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
