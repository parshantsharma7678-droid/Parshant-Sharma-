import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _userEmail = '';
  String _userName = 'Guest';

  bool get isLoggedIn => _isLoggedIn;
  String get userEmail => _userEmail;
  String get userName => _userName;

  Future<bool> signInWithGoogle() async {
    try {
      _isLoggedIn = true;
      _userName = 'Parshant Sharma';
      _userEmail = 'parshant@aurabiz.com';
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      _isLoggedIn = false;
      _userEmail = '';
      _userName = 'Guest';
      notifyListeners();
    } catch (e) {
      // Error handling
    }
  }

  Future<bool> verifyTwoFactor(String code) async {
    try {
      if (code.length == 6) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
