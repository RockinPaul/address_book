import 'package:flutter/material.dart';
import 'package:address_book/address_book.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<String> contacts = [
      'Adi Shamir',
      'Alan Kay',
      'Andrew Yao',
      'Barbara Liskov',
      'Kristen Nygaard',
      'Leonard Adleman',
      'Leslie Lamport',
      'Ole-Johan Dahl',
      'Peter Naur',
      'Robert E. Kahn',
      'Ronald L. Rivest',
      'Vinton G. Cerf',
    ];
    contacts.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    Map<String, List<String>> groupedContacts = Map<String, List<String>>();
    contacts.forEach((name) {
      String firstChar = name.substring(0, 1);
      if (!groupedContacts.keys.contains(firstChar)) {
        groupedContacts[firstChar] =
            contacts.where((contact) => contact.startsWith(firstChar)).toList();
      }
    });

    return MaterialApp(
      home: AddressBook(
        contacts: groupedContacts,
        sectionToGo:
            "K", // An API to scroll to certain section from the outside
      ),
    );
  }
}
