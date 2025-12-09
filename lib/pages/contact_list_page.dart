import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  final contacts = List.generate(20, (i) => "Contact ${i + 1}");

  ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(contacts[index]),
          );
        },
      ),
    );
  }
}
