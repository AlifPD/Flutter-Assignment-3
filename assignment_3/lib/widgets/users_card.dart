import 'package:assignment_3/models/users_model.dart';
import 'package:flutter/material.dart';

class UsersCardWidget extends StatelessWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  const UsersCardWidget({
    super.key,
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "$id",
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                    Text(
                      email,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                    Text(
                      "${address.city} -- ${address.street} -- ${address.suite} -- ${address.zipcode} -- ${address.geo.lat} ; ${address.geo.lng}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                    Text(
                      website,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                    Text(
                      "${company.name} -- ${company.catchPhrase} -- ${company.bs}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
