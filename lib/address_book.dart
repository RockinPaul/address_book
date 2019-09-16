import 'package:flutter/material.dart';
import 'package:address_book/address_book_section.dart';

class HeaderRowListView extends StatelessWidget {
  final Map<String, List<String>> contacts;

  const HeaderRowListView({Key key, this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> keys = contacts.keys.toList();
    List<List<String>> values = contacts.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return AddressBookSection(title: keys[index], contacts: values[index]);
        }
      ),
    );
  }
}
