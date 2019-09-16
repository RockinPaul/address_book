import 'package:flutter/material.dart';
import 'package:address_book/address_book_section.dart';

class HeaderRowListView extends StatelessWidget {
  final Map<String, List<String>> contacts;

  const HeaderRowListView({Key key, this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _keys = contacts.keys.toList();
    List<List<String>> _values = contacts.values.toList();
    ScrollController _scrollController = new ScrollController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
      appBar: AppBar(
        title: Text('Contacts'),
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
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return AddressBookSection(title: _keys[index], contacts: _values[index]);
              }
            ),
          ),
          Container(
            child: Text("The ability to show widgets below the list"),
          ),
        ],
      ),
    );
  }
}
