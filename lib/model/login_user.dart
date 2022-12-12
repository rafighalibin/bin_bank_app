import 'package:flutter/material.dart';
import 'package:bin_bank_app/model/user.dart';
class CurrentUserProfileModel extends ChangeNotifier {
  UserProfile? _user;

  void addUser(UserProfile user) {
    _user = user;
    notifyListeners();
  }

  bool hasCurrentUser() => _user != null;

  // Getter
  UserProfile? get user => _user;

  void removeUser() {}
}