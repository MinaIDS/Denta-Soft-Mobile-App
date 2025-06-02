import 'package:denta_soft/models/AccountModel.dart';
import 'package:denta_soft/services/UsersServices.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersScreenController extends ChangeNotifier {
  var searchController = TextEditingController();
  var refreshController = RefreshController();
  var isLoading = false;
  var scrollController = ScrollController();
  var isSearching = false;

  List<ObjectData> usersList = [];

  // Search for users by username
  Future<void> searchForUsers({required String username}) async {
    try {
      isLoading = true;
      notifyListeners();

      final _usersList = await UsersServices().postSearchUsers(
        username: username,
      );
      usersList = _usersList;
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Refresh the users list
  Future<void> onRefresh() async {
    try {
      final _usersList = await UsersServices().postSearchUsers(username: "");
      usersList = _usersList;
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      refreshController.refreshCompleted();
    }
  }

  // Update user data
  Future<bool> updateUserData({
    required String userID,
    required ObjectData userData,
  }) async {
    try {
      bool result = await UsersServices().updateUser(
        userID: userID,
        userData: userData,
      );
      return result;
    } catch (e) {
      return false;
    }
  }

  // Delete user(s) by IDs
  Future<bool> deleteUser(List<String> ids) async {
    try {
      bool status = await UsersServices().deleteUser(ids: ids);
      return status;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    searchController.removeListener(() {});
    searchController.dispose();
    refreshController.dispose();
    scrollController.dispose();
  }
}
