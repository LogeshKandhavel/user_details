import 'package:flutter/foundation.dart';
import '../models/user_list_model.dart';
import '../repo/api_status.dart';
import '../repo/user_list_service.dart';


class UsersViewModel extends ChangeNotifier {

  bool _loading = false;
  List<UserModel> _userListModel = [];
  String _errorMessage = '';


  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  String get errorMessage => _errorMessage;


  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setError(String  errorMessage) async {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.fetchUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      if (kDebugMode) {
        print('Failure');
      }
      setError(response.errorResponse);
    }
    setLoading(false);
  }
}
