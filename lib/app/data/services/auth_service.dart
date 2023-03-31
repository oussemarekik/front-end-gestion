import 'package:project_management_frontend/app/core/utils/constant.dart';

import 'package:project_management_frontend/app/data/models/entities/customer.dart';
import 'package:project_management_frontend/app/data/providers/api_provider.dart';
import 'package:project_management_frontend/app/data/providers/storage_provider.dart';

import '../models/access_user.dart';
import '../models/app_auth.dart';

class AuthService {

  static bool isAuthenticated = false;
  static Customer? currentUser;
  static AccessUser? access;


  Future<bool> customerAuth({ required AppAuth auth }) async {

    final response = await ApiProvider().post(
      endpoint: "/v1/auth/login",
      encodeBody: false,
      body: auth.toJson(),
    );
    if(response != null && response["access_token"] != null) {
      StorageHelper storage = StorageHelper();
      access = AccessUser(token: response["access_token"],);
      storage.saveItem(storageAccessUser, access?.toJson());
      isAuthenticated = true ;
    }
    return isAuthenticated;
  }

  Future<bool> refreshToken() async {
    StorageHelper storage = StorageHelper();
    final response = await ApiProvider().get(
      endpoint: "/v1/auth/refresh",
    );
    if(response != null && response["token"] != null) {
      access = AccessUser(token: response["token"],);

      storage.saveItem(storageAccessUser, access?.toJson());

      isAuthenticated = true;
    }
    return isAuthenticated;
  }

  logout() {
    StorageHelper storage = StorageHelper();
    storage.removeItem(storageAccessUser);
    access =  AccessUser();
    isAuthenticated = false;
  }

  Future<bool> isLoggedIn() async {
    StorageHelper storage = StorageHelper();
    access =  AccessUser.fromJson(await storage.fetchItem(storageAccessUser));
    isAuthenticated = access?.token != null;
    return isAuthenticated;
  }
}