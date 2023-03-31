import 'package:flutter/material.dart';
import '../../enums/role.dart';

class User {
  String id;
  String? firstName;
  String? lastName;
  String? role;
  String? username;
  String? password;

  User({ this.id="",required this.firstName,required this.lastName,required this.role,required this.username,required this.password});

  factory User.formJson(Map<String, dynamic> json) => User(
      id:json["_id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      role: json["role"],
      username: json["username"],
      password: json["password"]);
  Map<String, dynamic> toJson()=>
      {
        "firstName":firstName,
        "lastName":lastName,
        "role":role,
        "usernam":username,
        "password":password
      };

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, role: $role, username: $username, password: $password}';
  }
}
