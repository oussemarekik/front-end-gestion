import 'dart:convert';

import 'package:get_cli/common/utils/json_serialize/json_ast/error.dart';
import 'package:project_management_frontend/app/data/enums/role.dart';
import 'package:project_management_frontend/app/data/models/entities/customer.dart';
import 'package:project_management_frontend/app/data/providers/api_provider.dart';

import '../models/entities/user.dart';

class CustomerService {

  Future<Map<String, dynamic>?> createUser(Customer user) async {

    final response = await ApiProvider().post(
        endpoint: "/v1/auth/register",
        isFormData: true,
        body: user.toJson(),
    );
    return response;
  }

  Future<Customer?> getUser() async {
    final response = await ApiProvider().get(
      endpoint: "/v1/customer/get",
    );
    if(response != null && response["customer"] != null) {
      return Customer.fromJson(response["customer"]);
    }
    return null;
  }
  Future<List<User>?>getAllUser()async{
    final response=await ApiProvider().get(
      endpoint: "/v1/user/",
    );

    dynamic list=response!["list"];
    print(list);
    List<User> listUser=[];
    for(Map<String,dynamic> l in list)
      {
        listUser.add(User.formJson(l));
      }

    return listUser;
  }
  Future<Map<String, dynamic>?> updateUser(Customer user) async {
    final response = await ApiProvider().patch(
        endpoint: '/v1/customer/update',
        encodeBody: false,
        body: user.toJson(),
    );
    return response;
  }

  deleteUser() async {
    final response = await ApiProvider().delete(
        endpoint: '/v1/customer/delete'
    );
    return response;
  }

}