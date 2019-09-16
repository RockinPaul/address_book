import 'package:flutter/material.dart';
import 'package:address_book/address_book_section.dart';

class Search extends SearchDelegate<String> {
  final Map<String, List<String>> contacts;

  Search(this.contacts);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> _keys = contacts.keys.toList();
    List<List<String>> _values = contacts.values.toList();

    String keySuggestion;
    List<String> results = List<String>();

    if (query.length > 0) {
      keySuggestion = _keys.firstWhere(
            (key) => key.toLowerCase() == query.substring(0, 1).toLowerCase(),
        orElse: () => "",
      );
      if (contacts[keySuggestion] != null) {
        results = contacts[keySuggestion].where((contact) {
          return contact.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    }

    return ListView.builder(
        shrinkWrap: true,
        itemCount: results.length != 0 ? 1 : contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return AddressBookSection(
              title: results.length != 0 ? keySuggestion : _keys[index],
              contacts: results.length != 0 ? results : _values[index]);
        });
  }
}
