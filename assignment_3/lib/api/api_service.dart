import 'dart:convert';

import 'package:assignment_3/models/posts_model.dart';
import 'package:assignment_3/models/users_model.dart';
import 'package:http/http.dart' as http;

Future<List<PostsModel>?> getPosts() async {
  try {
    List<PostsModel> listPosts = [];

    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    final decodedRes = json.decode(res.body);

    decodedRes.forEach((val) {
      final currentData = PostsModel(
        userId: val['userId'],
        id: val['id'],
        title: val['title'],
        body: val['body'],
      );
      listPosts.add(currentData);
    });

    return listPosts;
  } catch (err) {
    throw Exception("Something is wrong");
  }
}

Future<List<UsersModel>?> getUsers() async {
  try {
    List<UsersModel> listUsers = [];

    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    final decodedRes = json.decode(res.body);

    decodedRes.forEach((val) {
      final currentData = UsersModel(
        id: val['id'],
        name: val['name'],
        username: val['username'],
        email: val['email'],
        address: Address(
          street: val['address']['street'],
          suite: val['address']['suite'],
          city: val['address']['city'],
          zipcode: val['address']['zipcode'],
          geo: Geo(
            lat: val['address']['geo']['lat'],
            lng: val['address']['geo']['lat'],
          ),
        ),
        phone: val['phone'],
        website: val['website'],
        company: Company(
          name: val['company']['name'],
          catchPhrase: val['company']['catchPhrase'],
          bs: val['company']['bs'],
        ),
      );
      listUsers.add(currentData);
    });

    return listUsers;
  } catch (err) {
    throw Exception("Something is wrong");
  }
}
