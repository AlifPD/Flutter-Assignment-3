import 'package:assignment_3/models/users_model.dart';
import 'package:assignment_3/widgets/users_card.dart';
import 'package:flutter/material.dart';
import 'package:assignment_3/api/api_service.dart' as api;

class UsersViewScreen extends StatefulWidget {
  const UsersViewScreen({super.key});

  @override
  State<UsersViewScreen> createState() => _UsersViewWidgetState();
}

class _UsersViewWidgetState extends State<UsersViewScreen> {
  bool _isLoading = false;

  bool _init = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder(
        future: api.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return const Center(
                child: Text("Something went wrong"),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return UsersCardWidget(
                    id: snapshot.data?[index].id ?? 0,
                    name: snapshot.data?[index].name ?? "",
                    username: snapshot.data?[index].username ?? "",
                    email: snapshot.data?[index].email ?? "",
                    address: snapshot.data?[index].address ??
                        Address(
                          street: "",
                          suite: "",
                          city: "",
                          zipcode: "",
                          geo: Geo(lat: "", lng: ""),
                        ),
                    phone: snapshot.data?[index].phone ?? "",
                    website: snapshot.data?[index].website ?? "",
                    company: snapshot.data?[index].company ??
                        Company(
                          name: "",
                          catchPhrase: "",
                          bs: "",
                        ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
