import 'package:flutter/material.dart';
import 'package:address_book/address_book_section.dart';

class AddressBook extends StatefulWidget {
  final Map<String, List<String>> contacts;

  const AddressBook({Key key, this.contacts}) : super(key: key);

  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  @override
  Widget build(BuildContext context) {
    List<String> _keys = widget.contacts.keys.toList();
    List<List<String>> _values = widget.contacts.values.toList();

    // For scrolling API
    Map<String, double> offsets = Map<String, double>();
    int values = 0;
    double offset = 0.0;
    for (int i = 0; i < _keys.length; i++) {
      offsets[_keys[i]] = offset;
      String key = _keys[i];
      values = widget.contacts[key].length;
      offset += values * 50 + 40;
    }

    print(offsets);

    ScrollController _scrollController = new ScrollController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            370,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ContactSearch(widget.contacts),
              );
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text("The ability to show widgets on top"),
          ),
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: widget.contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return AddressBookSection(
                      title: _keys[index], contacts: _values[index]);
                }),
          ),
          Container(
            child: Text("The ability to show widgets below the list"),
          ),
        ],
      ),
    );
  }
}

class ContactSearch extends SearchDelegate<String> {
  final Map<String, List<String>> contacts;

  ContactSearch(this.contacts);

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

    print(keySuggestion);
    print(results);

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
