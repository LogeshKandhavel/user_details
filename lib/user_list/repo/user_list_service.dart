import 'dart:convert';
import 'dart:io';
import '../../utilis/constants.dart';
import '../models/user_list_model.dart';
import 'api_status.dart';
import 'package:http/http.dart' as http;

class UserServices {


  static Future<Object> fetchUsers() async {
    try {
      var response = await http.get(Uri.parse(userListEndpoint));
      if (success == response.statusCode) {
        return Success(response: usersListModelFromJson(response.body), code: 200);
      }
      return Failure(
          code: userInvalidResponse, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: noInternet, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: noInternet, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: invalidFormat, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: unknownError, errorResponse: 'Unknown Error');
    }
  }
}

List<UserModel> usersListModelFromJson(String str){
  return List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
}
