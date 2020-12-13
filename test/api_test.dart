import 'dart:convert';

import 'package:flutter_tdd_api_calling/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test("api test", () async {
    MyUsersApi api = MyUsersApi();
    final users = await api.getUsers();

    print(users.first.name);
  });
}

class MyUsersApi {
  Future<List<User>> getUsers() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/users');
    var responseData = jsonDecode(response.body);

    return (responseData as List).map((item) => User.fromJson(item)).toList();
  }
}
